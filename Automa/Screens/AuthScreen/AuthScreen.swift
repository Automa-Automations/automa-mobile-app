//
//  AuthScreen.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/03.
//

import AlertToast
import Foundation
import Supabase
import SwiftUI

struct AuthScreen: View {
    @State var email = ""
    @State var isLoading = false
    @State var showPopover = false
    @State var showAlert = false
    @State var alertMessage = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 18) {
                VStack(spacing: 10) {
                    GenericTitle(title: "Lets sign you in.", description: "Welcome back. \nLets get automating!")
                }

                Spacer()

                Form {
                    Section {
                        TextField("Email", text: $email)
                            .textContentType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                    }

                    Section {
                        Button {
                            isLoading = true

                            signIn(email: email) {
                                if $0 {
                                    showVerificationPopover()
                                } else {
                                    showAlertDialog(isError: !$0, inputMessage: $1)
                                }
                                isLoading = false
                            }
                        } label: {
                            HStack {
                                Spacer()
                                if isLoading {
                                    ProgressView()
                                } else {
                                    Text("Sign In")
                                }
                                Spacer()
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
                .onOpenURL(perform: { url in
                    Task {
                        do {
                            try await supabase_().auth.session(from: url)
                        } catch {
                            showAlertDialog(isError: true, inputMessage: error.localizedDescription)
                        }
                    }
                })

                Text("We Reccomend Using Dark Mode for this app!").foregroundStyle(.black)

                Text("Automa is fully open source. Automa also uses a subscription based model. ".uppercased())
                    .font(.caption) +
                    Text("View our privacy policy".uppercased())
                    .foregroundStyle(Color("Primary"))
                    .font(.caption)
            }
            .toolbar {
                ExitAppToolBar()
            }
            .sheet(isPresented: $showPopover, content: {
                EmailSentSheet(email: email, showPopover: $showPopover)
                    .presentationDetents([.medium, .large])
            })
            .accentColor(Color("Primary"))
            .alert(isPresented: $showAlert) {
                AuthErrorAlertIOS(alertMessage: alertMessage)
            }
        }
    }

    func showVerificationPopover() {
        showPopover = true
    }

    func showAlertDialog(isError: Bool, inputMessage: String, shouldShowIfNotError: Bool = false) {
        if shouldShowIfNotError {
            showAlert = true
        }
        if isError {
            // TODO: Send logs to private discord channel (Grab this from database)
            showAlert = true
        }
        alertMessage = inputMessage
    }
}

#Preview {
    AuthScreen()
}
