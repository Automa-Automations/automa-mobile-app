//
//  StripePaymentProvider.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/07.
//
// TODO: Convert our app to use this as the payment provider, will make it easier to integrate payment into any view.
import Foundation
import StripePaymentSheet
import SwiftUI

class PaymentSheetModel: ObservableObject {
    let backendCheckoutUrl = URL(string: "\(apiBaseUrl)/stripe/payment-sheet")! // Your backend endpoint
    @Published var paymentSheet: PaymentSheet?
//    @Published var paymentSheets: [PaymentSheet?]  So that we can have all the payment sheets for all the subscriptions
    @Published var paymentResult: PaymentSheetResult?

    func preparePaymentSheet(view: UIViewController, payment: String, completion: @escaping (String, Bool) async -> Void) async {
        // Define your JSON data
        let currentUser = try! await supabase_().auth.session.user.id
        let jsonData: [String: Any] = [
            "planId": payment,
            "userId": currentUser.uuidString,
        ]

        // Serialize JSON data
        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonData) else {
            print("Error serializing JSON data")
            return
        }

        var request = URLRequest(url: backendCheckoutUrl)
        request.httpMethod = "POST"
        request.httpBody = jsonData // Set JSON data as the request body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("X-API-Key", forHTTPHeaderField: "302e5a68-1bbe-4cbf-9a73-ef82ee441ba3")

        let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] data, _, error in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                  let customerId = json["customer"] as? String,
                  let customerEphemeralKeySecret = json["ephemeralKey"] as? String,
                  let paymentIntentClientSecret = json["paymentIntent"] as? String,
                  let publishableKey = json["publishableKey"] as? String,
                  let self = self
            else {
                print(error ?? "No Error")
                return
            }

            STPAPIClient.shared.publishableKey = publishableKey

            // MARK: Create a PaymentSheet instance

            var configuration = PaymentSheet.Configuration()
            configuration.merchantDisplayName = "Example, Inc."
            configuration.customer = .init(id: customerId, ephemeralKeySecret: customerEphemeralKeySecret)
            // Set `allowsDelayedPaymentMethods` to true if your business can handle payment methods
            // that complete payment after a delay, like SEPA Debit and Sofort.
            configuration.allowsDelayedPaymentMethods = true

            DispatchQueue.main.async {
                let paymentSheet = PaymentSheet(paymentIntentClientSecret: paymentIntentClientSecret, configuration: configuration)
                self.paymentSheet = paymentSheet
                paymentSheet.present(from: view) { paymentResult in
                    // Handle payment result
                    switch paymentResult {
                    case .completed:
                        Task {
                            await completion("Payment Completed Successfully!", true)
                        }
                    case .canceled:
                        Task {
                            await completion("You have cancelled the transaction 😔", false)
                        }
                    case let .failed(error):
                        Task {
                            await completion("Payment failed with error: \(error.localizedDescription)", false)
                        }
                    }
                }
            }
        })
        task.resume()
    }

    func onPaymentCompletion(result: PaymentSheetResult) {
        paymentResult = result
    }
}
