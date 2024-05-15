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
    let backgroundColor: UInt

    var body: some View {
        Button(action: {
            Task.detached {
                if let viewController = await UIApplication.shared.windows.first?.rootViewController {
                    await model.preparePaymentSheet(view: viewController, payment: paymentType) { successMessage, success in
                        if success {
                            await setPaymentBool(false)
                        } else {
                            await showErrorDialog(successMessage, true)
                        }
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
        }
    }
}
