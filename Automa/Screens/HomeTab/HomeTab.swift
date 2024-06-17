//
//  HomeScreen.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/25.
//

import SwiftUI

struct HomeTab: View {
    var body: some View {
        NavigationStack {
            TabView {
                Home()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }

                Credits()
                    .tabItem {
                        Image(systemName: "command.square.fill")
                        Text("Credits")
                    }

                CreateBot()
                    .tabItem {
                        Image(systemName: "plus.app")
                        Text("New Bot")
                    }
                Notifications_()
                    .tabItem {
                        Image(systemName: "bell")
                        Text("Notifications")
                    }
                
                Settings_()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }.tint(.green)
        }
    }
}






struct TransactionCell: View {
    let transaction: Transaction
    var body: some View {
        GroupBox {
            HStack {
                VStack(alignment: .leading) {
                    Text(transaction.created_at.formatted().split(separator: ",")[0])
                        .font(.callout)
                        .foregroundStyle(Color("DarkAccentColor"))
                    HStack {
                        Spacer()
                        if transaction.credits > 0 {
                            Text("+\(transaction.credits) ⌘")
                                .foregroundStyle(.green)
                                .fontWeight(.bold)
                        } else {
                            Text("\(transaction.credits) ⌘")
                                .foregroundStyle(.red)
                                .fontWeight(.bold)
                        }
                    }
                    Text("※ \(transaction.head)")
                        .font(.callout)
                        .foregroundStyle(Color("DarkAccentColor"))
                }
                Spacer()
            }
        }
    }
}

#Preview {
    Credits()
}

struct BuyCreditsButton: View {
    let credits: Int
    @Binding var isBuyCredits: Bool
    let model: PaymentSheetModel
    @Binding var mod: Date

    var body: some View {
        GroupBox {
            Button(action: {
                isBuyCredits = false
                Task.detached {
                    if let viewController = await UIApplication.shared.windows.first?.rootViewController {
                        do {
                            await model.preparePaymentSheet(view: viewController, payment: "credits_\(credits)", completion: { _, success in
                                if success {
                                    print("TRUE")
                                    mod = Date()
                                } else {
                                    print("FALSE")
                                    mod = Date()
                                }
                            })
                        } catch {
                            print("DO SOMETHING HERE!")
                        }
                    }
                    mod = Date()
                }
            }) {
                Image(systemName: "command.square.fill")
                Text("\(credits) Credits")
                Spacer()
            }
        }
    }
}



struct CreditsMetadataView: View {
    let transaction: Transaction

    var body: some View {
        VStack {
            Text("Coming Soon")
        }
    }
}
