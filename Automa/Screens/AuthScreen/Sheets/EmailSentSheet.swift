//
//  EmailSentSheet.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/06.
//

import SwiftUI

struct EmailSentSheet: View {
    let email: String
    @State var showToast = false
    @Binding var showPopover: Bool

    func showingToast() {
        showToast.toggle()
    }

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                VStack(spacing: 12) {
                    Text("We have sent an email.")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextPrimary"))
                        .multilineTextAlignment(.center)

                    Text("Click on the email sso link that we sent to you on \(email). \nThen click next!")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20))
                        .fontWeight(.thin)

                    Button(action: {
                        showingToast()
                    }) {
                        Text("Didn't recieve the email yet? ").font(.caption) +
                            Text("Send Again")
                            .foregroundStyle(Color("Primary"))
                            .font(.caption)
                    }.accentColor(Color("TextPrimary"))
                }

                Spacer()
            }
            .toolbar {
                CloseEmailSentSheetToolBar(showPopover: $showPopover)
            }
            .accentColor(Color("Primary"))
            .padding()
        }
        .toast(isPresenting: $showToast) {
            EmailResentAlert()
        }
    }
}

#Preview {
    EmailSentSheet(email: "business@simonferns.com", showPopover: .constant(false))
}
