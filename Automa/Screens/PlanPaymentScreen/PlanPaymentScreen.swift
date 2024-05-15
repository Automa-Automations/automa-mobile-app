//
//  PlanPaymentScreen.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/03.
//

import Foundation
import StripePaymentSheet
import SwiftUI

struct PlanPaymentScreen: View {
    @ObservedObject var model = PaymentSheetModel()
    @Binding var isAuthenticated: Bool
    @Binding var shouldShowPaymentScreen: Bool
    @State var isError: Bool = false
    @State var errorMessage: String = ""
    @State var plans: [PlanItem] = []
    @State var isPlansLoading: Bool = true

    var body: some View {
        NavigationStack {
            if isPlansLoading {
                ProgressView()
            } else {
                VStack {
                    VStack(spacing: 10) {
                        GenericTitle(title: "Choose a plan.", description: "Spend less time.\nExponential results!")

                        Spacer()

                        VStack {
                            if plans.count > 0 {
                                ZStack {
                                    PaymentButton(model: model, setPaymentBool: setPaymentBool, showErrorDialog: showErrorDialog, paymentType: plans[0].id, title: plans[0].name, price: plans[0].price_rep, backgroundColor: 0x5F2E18)

                                    VStack {
                                        VStack {
                                            Text("Most Popular").padding(.all, 7).padding(.horizontal, 10)
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

                                ForEach(plans[1...]) { plan in
                                    PaymentButton(model: model, setPaymentBool: setPaymentBool, showErrorDialog: showErrorDialog, paymentType: plan.id, title: plan.name, price: plan.price_rep, backgroundColor: UInt(plan.hex_color_int))
                                }
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
                .toolbar {
                    SignOutToolbar(isAuthenticated: $isAuthenticated)
                }
                .alert(isPresented: $isError, content: {
                    PaymentError(alertMessage: errorMessage)
                })
            }
        }.task {
            let result = try! await fetchAllPlans()
            plans = result
        }
    }

    func setPaymentBool(value: Bool) {
        shouldShowPaymentScreen = value
    }

    func showErrorDialog(message: String, shouldShow: Bool) {
        isError = shouldShow
        errorMessage = message
    }

    func fetchAllPlans() async throws -> [PlanItem] {
        do {
            let items: [PlanItem] = try await supabase_().database.from("plans").select().execute().value
            isPlansLoading = false
            return items.sorted { lhs, rhs -> Bool in
                lhs.popularity_score > rhs.popularity_score
            }
        } catch {
            print(error)
        }
        isPlansLoading = false
        return []
    }
}

#Preview {
    PlanPaymentScreen(isAuthenticated: .constant(false), shouldShowPaymentScreen: .constant(false))
}
