//
//  CheckoutView.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/03.
//

import Foundation
import StripePaymentSheet
import SwiftUI


struct CheckoutView: View {
    @ObservedObject var model = PaymentSheetModel()
    @Binding var isAuthenticated: Bool
    @Binding var shouldShowPaymentScreen: Bool
    @State var isError: Bool = false
    @State var errorMessage: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 10) {
                    GenericTitle(title: "Choose a plan.", description: "Spend less time.\nExponential results!")
                    
                                        
                    Spacer()
                    
                    VStack {
                        ZStack {
                            PaymentButton(model: model, setPaymentBool: setPaymentBool, showErrorDialog: showErrorDialog, paymentType: "plan_premium", title: "Premium", price: "$29.99", backgroundColor: 0x5F2E18)
                            
                            
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
                        
                        PaymentButton(model: model, setPaymentBool: setPaymentBool, showErrorDialog: showErrorDialog, paymentType: "plan_exclusive",title: "Exclusive", price: "$59.99", backgroundColor: 0x12550F)
                            

                        PaymentButton(model: model, setPaymentBool: setPaymentBool, showErrorDialog: showErrorDialog, paymentType: "plan_standard", title: "Standard", price: "$14.99", backgroundColor: 0x404151)
                        
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
    }
    
    func setPaymentBool(value: Bool) {
        shouldShowPaymentScreen = value
    }
    
    func showErrorDialog(message: String, shouldShow: Bool) {
        isError = shouldShow
        errorMessage = message
    }
}

#Preview {
    CheckoutView(isAuthenticated: .constant(false), shouldShowPaymentScreen: .constant(false))
}


