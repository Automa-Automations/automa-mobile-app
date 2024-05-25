//
//  PaymentButton.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/07.
//

import Foundation
import SwiftUI

struct PaymentButton: View {
    let model: PaymentSheetModel
    let setPaymentBool: (Bool) -> Void
    let showErrorDialog: (String, Bool) -> Void
    let paymentType: String
    let title: String
    let price: String
    let cta_page: [String]
    let backgroundColor: UInt
    @State var ctaScreen: Bool = false
    let shouldShowCTA: Bool
    let preExecution: () -> Void

    var body: some View {
        Button(action: {
            if shouldShowCTA {
                ctaScreen = true
                return
            }

            preExecution()
            Task.detached {
                if let viewController = await UIApplication.shared.windows.first?.rootViewController {
                    do {
                        await model.preparePaymentSheet(view: viewController, payment: paymentType, completion: { successMessage, success in
                            if success {
                                await setPaymentBool(false)
                                preExecution()
                            } else {
                                await showErrorDialog(successMessage, true)
                                preExecution()
                            }
                        })
                    } catch {
                        print("DO SOMETHING HERE!")
                    }
                }
            }
        }) {
            

            HStack {
                Text(title.uppercased())
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
                Text(price.uppercased())
                    .font(.title)
                    .fontWeight(.heavy)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity)
            .background(Color(hex: backgroundColor))
            .cornerRadius(9)
        }.sheet(isPresented: $ctaScreen, content: {
            NavigationStack {
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(cta_page, id: \.self) { item in
                            if item.hasPrefix("# ") {
                                let desc = item.replacingOccurrences(of: "# ", with: "")
                                        GenericTitle(title: "\(title) Plan.", description: desc, padding: nil)
                            } else if item.hasPrefix("## ") {
                                Text(item.replacingOccurrences(of: "## ", with: ""))
                                    .font(.custom("Inter", size: 26))
                                    .fontWeight(.thin)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 25.0)
                                    .foregroundColor(Color("TextPrimary"))
                            } else if item.hasPrefix("<buy_button>") {
                                PaymentButton(model: model, setPaymentBool: setPaymentBool, showErrorDialog: showErrorDialog, paymentType: paymentType, title: title, price: price, cta_page: [], backgroundColor: backgroundColor, shouldShowCTA: false, preExecution: { preExecution(); ctaScreen = false; }).padding(.horizontal, 25)
                            } else {
                                Text(item).padding(.horizontal, 25)
                            }
                        }
                    }.padding(.top, 25)
                }.toolbar {
                    CloseSheetToolbar(sheetOpen: $ctaScreen)
                }
            }

        })
    }
}
