//
//  CheckoutView.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/03.
//

import Foundation
import StripePaymentSheet
import SwiftUI

class MyBackendModel: ObservableObject {
    let backendCheckoutUrl = URL(string: "http://localhost:4242/payment-sheet")! // Your backend endpoint
    @Published var paymentSheet: PaymentSheet?
//    @Published var paymentSheets: [PaymentSheet?]  So that we can have all the payment sheets for all the subscriptions
    @Published var paymentResult: PaymentSheetResult?

    func preparePaymentSheet(view: UIViewController, payment: String, completion: @escaping (String, Bool) async -> Void) async {
        // Define your JSON data
        let currentUser = try! await supabase.auth.session.user.id
        let jsonData: [String: Any] = [
            "priceId": payment,
            "userId": currentUser.uuidString
            
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
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] data, _, error in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                  let customerId = json["customer"] as? String,
                  let customerEphemeralKeySecret = json["ephemeralKey"] as? String,
                  let paymentIntentClientSecret = json["paymentIntent"] as? String,
                  let publishableKey = json["publishableKey"] as? String,
                  let self = self else {
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
                            await completion(paymentIntentClientSecret, true)
                        }
                    case .canceled:
                        print("Payment canceled.")
                        Task {
                            await completion(paymentIntentClientSecret, false)
                            
                        }
                    case .failed(let error):
                        print("Payment failed with error: \(error.localizedDescription)")
                        Task {
                            await completion(paymentIntentClientSecret, false)
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

struct CheckoutView: View {
    @ObservedObject var model = MyBackendModel()
    @Binding var isAuthenticated: Bool
    @Binding var shouldShowPaymentScreen: Bool

    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 10) {
                    Text("Choose a plan.")
                        .font(.custom("Inter", size: 42))
                        .fontWeight(.thin)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 25.0)
                        .foregroundColor(Color("Primary"))
                    
                    Text("Spend less time.\nExponential results!")
                        .font(.custom("Inter", size: 32))
                        .fontWeight(.thin)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 25.0)
                        .foregroundColor(Color("TextPrimary"))
                    
                    Spacer()
                    
                    VStack {
                        ZStack {
                            Button(action: {
                                Task.detached {
                                    if let viewController = await UIApplication.shared.windows.first?.rootViewController {
                                        await model.preparePaymentSheet(view: viewController, payment: "plan_premium") { paymentIntentClientSecret, success in
                                            if success {
                                                print("Payment succeeded with client secret: \(paymentIntentClientSecret)")
                                                await setPaymentBool(value: false)
                                            } else {
                                                print("Payment failed or canceled with client secret: \(paymentIntentClientSecret)")
                                            }
                                        }
                                    }
                                }
                            }) {
                                // Your button content
                                HStack {
                                    Text("Premium".uppercased())
                                        .font(.title)
                                        .fontWeight(.heavy)
                                    Spacer()
                                    Text("$29.99".uppercased())
                                        .font(.title)
                                        .fontWeight(.heavy)
                                }
                                .padding(.vertical, 20)
                                .padding(.horizontal, 30)
                                .frame(maxWidth: .infinity)
                                .background(Color(hex: 0x5F2E18))
                                .cornerRadius(9)
                            }
                            
                            
                            VStack {
                                VStack {
                                    Text("Most Popular").padding(.all, 8)
                                }
                                .background(Color(hex: 0x404151))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 2)
                                )
                            }
                            .offset(y: -40).foregroundColor(.white)
                        }
                        
                        Button(action: {
                            Task.detached {
                                if let viewController = await UIApplication.shared.windows.first?.rootViewController {
                                    await model.preparePaymentSheet(view: viewController, payment: "plan_exclusive") { paymentIntentClientSecret, success in
                                        if success {
                                            print("Payment succeeded with client secret: \(paymentIntentClientSecret)")
                                            await setPaymentBool(value: false)
                                            // Handle successful payment
                                        } else {
                                            print("Payment failed or canceled with client secret: \(paymentIntentClientSecret)")
                                        }
                                    }
                                }
                            }
                        }) {
                            HStack {
                                Text("Exclusive".uppercased()).font(.title).fontWeight(.heavy)
                                Spacer()
                                
                                Text("$59.99".uppercased()).font(.title).fontWeight(.heavy)
                            }
                            .padding(.vertical, 20)
                            .padding(.horizontal, 30)
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: 0x12550F))
                            .cornerRadius(9)
                        }
                        
                        Button(action: {
                            Task.detached {
                                if let viewController = await UIApplication.shared.windows.first?.rootViewController {
                                    
                                    await model.preparePaymentSheet(view: viewController, payment: "plan_standard") { paymentIntentClientSecret, success in
                                        if success {
                                            print("Payment succeeded with client secret: \(paymentIntentClientSecret)")
                                            await setPaymentBool(value: false)
                                            // Handle successful payment
                                        } else {
                                            print("Payment failed or canceled with client secret: \(paymentIntentClientSecret)")
                                        }
                                    }
                                }
                            }
                        }) {
                            HStack {
                                Text("Standard".uppercased()).font(.title).fontWeight(.heavy)
                                Spacer()
                                
                                Text("$14.99".uppercased()).font(.title).fontWeight(.heavy)
                            }
                            .padding(.vertical, 20)
                            .padding(.horizontal, 30)
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: 0x303253))
                            .cornerRadius(9)
                        }
                    }.tint(.white)
                    .padding()
                }
                if let result = model.paymentResult {
                    switch result {
                    case .completed:
                        Text("Payment complete")
                    case let .failed(error):
                        Text("Payment failed: \(error.localizedDescription)")
                    case .canceled:
                        Text("Payment canceled.")
                    }
                }
            }
            .padding(.bottom)
            .toolbar { ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    signOut {
                        isAuthenticated = false
                        
                        if !$0 {
                            print("REMEMBER TO ADD THE POPUP HERE! \($1)")
                        }
                    }
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Sign Out")
                    }.accentColor(.brown)
                }
            }
            }
        }
    }
    
    func setPaymentBool(value: Bool) {
        shouldShowPaymentScreen = value
    }
}

#Preview {
    CheckoutView(isAuthenticated: .constant(false), shouldShowPaymentScreen: .constant(false))
}
