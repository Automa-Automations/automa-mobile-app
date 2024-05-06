//
//  AuthView.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/03.
//

import Foundation
import SwiftUI
import AlertToast
import Supabase

struct AuthView: View {
  @State var email = ""
  @State var isLoading = false
  @State var showToast = false
  @State var result: Result<Void, Error>?
  @State var showPopover = false

  var body: some View {
      NavigationStack {
          VStack(spacing: 18) {
              VStack(spacing: 10) {
                  Text("Lets sign you in.")
                      .font(.custom("Inter", size: 42))
                      .fontWeight(.thin)
                      .frame(maxWidth: .infinity, alignment: .leading)
                      .padding(.leading, 25.0)
                      .foregroundColor(Color("Primary"))
                  
                  Text("Welcome back. \n Lets get Automating!")
                      .font(.custom("Inter", size: 32))
                      .fontWeight(.thin)
                      .frame(maxWidth: .infinity, alignment: .leading)
                      .padding(.leading, 25.0)
                      .foregroundColor(Color("TextPrimary"))
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
                  Button(action: signInButtonTapped) {
                      HStack {
                          Spacer()
                          Text("Sign In")
                          Spacer()
                      }
                      .padding(.vertical, 8)
                  }

                if isLoading {
                  ProgressView()
                }
              }

              if let result {
                Section {
                  switch result {
                  case .success:
                    Text("Check your inbox.")
                  case .failure(let error):
                    Text(error.localizedDescription).foregroundStyle(.red)
                  }
                }
              }
          }
            .onOpenURL(perform: { url in
              Task {
                do {
                  try await supabase.auth.session(from: url)
                } catch {
                  self.result = .failure(error)
                }
              }
        })
              
              Text("We Reccomend Using Dark Mode for this app!").foregroundStyle(.black)
             
              Text("Automa is fully open source. Automa also uses a subscription based model. ".uppercased())
                  .font(.caption) + Text("View our privacy policy".uppercased()).foregroundStyle(Color("Primary")).font(.caption)
          }.toolbar {
              ToolbarItemGroup(placement: .topBarLeading) {
                  Button(action: {
                      UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                  }) {
                      HStack {
                          Image(systemName: "chevron.left")
                          Text("Exit")
                      }.accentColor(.brown)
                  }
              }
          }
          .sheet(isPresented: $showPopover, content: {
              
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
                              signInButtonTapped()
                              showingToast()
                          }) {
                              Text("Didn't recieve the email yet? ").font(.caption) +
                              Text("Send Again")
                                  .foregroundStyle(Color.blue)
                                  .font(.caption)
                          }.accentColor(Color("TextPrimary"))
                      }
                      
                      Spacer()
                  }
                  .accentColor(Color("Primary"))
                  .padding()
                  .toolbar {
              ToolbarItemGroup(placement: .topBarLeading) {
                  Button(action: {
                      showPopover = false
                  }) {
                      HStack {
                          Image(systemName: "chevron.left")
                          Text("Close")
                      }.accentColor(.brown)
                  }
              }
                  }
          }.toast(isPresenting: $showToast){
      
      // `.alert` is the default displayMode
      AlertToast(type: .regular, title: "Email Sent Again!")
      
      //Choose .hud to toast alert from the top of the screen
      //AlertToast(displayMode: .hud, type: .regular, title: "Message Sent!")
      
      //Choose .banner to slide/pop alert from the bottom of the screen
      //AlertToast(displayMode: .banner(.slide), type: .regular, title: "Message Sent!")
  }
          .presentationDetents([.medium, .large])

          })
      .accentColor(Color("Primary"))
      }

  }
  func signInButtonTapped() {
    Task {
      isLoading = true
      defer { isLoading = false }
        

      do {
        try await supabase.auth.signInWithOTP(
            email: email,
            redirectTo: URL(string: "com.simonferns.automa://login-callback")
        )
        result = .success(())
        showVerificationPopover(isError: false)
      } catch {
        result = .failure(error)
        showVerificationPopover(isError: true)
      }
    }
  }
  
    func showVerificationPopover(isError: Bool) {
        if isError {
            print("Show Error Popover")
        } else {
            print("Show Non Error Popover")
            showPopover = true
        }
    }
        
    func showingToast() {
        showToast.toggle()
    }
}


#Preview {
    AuthView()
}
