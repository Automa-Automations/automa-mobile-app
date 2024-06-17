//
//  Credits.swift
//  Automa
//
//  Created by Simon Ferns on 2024/06/17.
//
import SwiftUI

struct Credits: View {
    @State var isBuyCredits: Bool = false
    @ObservedObject var model = PaymentSheetModel()
    @State var isLoading: Bool = true
    @State var transactions: [Transaction] = []
    @State var transactionPurchase: Date = Date()
    @State var credits: Int = 0

    var body: some View {
        NavigationStack {
            if isLoading {
                ProgressView()
            } else {
                VStack {
                    ScrollView(showsIndicators: false) {
                        GenericTitle(title: "Credits", description: nil, padding: 26)

                        VStack(spacing: 35) {
                            GroupBox {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Credit balance")
                                            .font(.footnote)
                                            .foregroundStyle(Color("DarkAccentColor"))
                                        Text("\(credits) ⌘")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)

                                        Button(action: { isBuyCredits.toggle() }) {
                                            GroupBox {
                                                Text("Buy more").foregroundStyle(Color("DarkAccentColor"))
                                            }
                                        }.contextMenu(ContextMenu(menuItems: {
                                            BuyCreditsButton(credits: 100, isBuyCredits: $isBuyCredits, model: model, mod: $transactionPurchase)

                                            BuyCreditsButton(credits: 500, isBuyCredits: $isBuyCredits, model: model, mod: $transactionPurchase)

                                            BuyCreditsButton(credits: 1000, isBuyCredits: $isBuyCredits, model: model, mod: $transactionPurchase)

                                            Text("Earn free credits")
                                        }))
                                    }
                                    Spacer()
                                }
                            }.padding(.horizontal, 20)
                                .contextMenu(menuItems: {
                                    Text("Setup auto-refill")
                                    Text("Buy Previous amount")
                                    Text("Transfer Credits")
                                    Text("Report a problem")
                                })

                            VStack {
                                GenericTitle(title: nil, description: "Transactions", padding: -1)
                                ForEach(self.transactions, id: \.id) { transaction in
                                    NavigationLink(value: transaction) {
                                        TransactionCell(transaction: transaction)
                                    }
                                }

                            }.padding(.horizontal, 20)
                                .navigationDestination(for: Transaction.self) { transaction in
                                    CreditsMetadataView(transaction: transaction)
                                }

                            Spacer()
                        }
                    }
                }
                .tint(.gray)
                .sheet(isPresented: $isBuyCredits) {
                    NavigationStack {
                        VStack {
                            HStack {
                                BuyCreditsButton(credits: 500, isBuyCredits: $isBuyCredits, model: model, mod: $transactionPurchase)

                                BuyCreditsButton(credits: 1000, isBuyCredits: $isBuyCredits, model: model, mod: $transactionPurchase)
                            }

                            BuyCreditsButton(credits: 2000, isBuyCredits: $isBuyCredits, model: model, mod: $transactionPurchase)
                        }.toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    isBuyCredits.toggle()
                                }
                                ) {
                                    HStack {
                                        Image(systemName: "chevron.left")
                                        Text("Exit")
                                    }.tint(.brown)
                                }
                            }
                        }
                        .padding()
                        Spacer()
                    }.tint(.cyan)
                        .presentationDetents([.fraction(0.3)])
                }
            }
        }.onAppear {
            Task.detached {
                await getUserTransactions(completion: self.saveTransactions)
            }
        }
        .onChange(of: transactionPurchase) {
            Task.detached {
                await getUserTransactions(completion: self.saveTransactions)
            }
        }
    }

    func saveTransactions(transactions_: [Transaction]?, credits_: Int?, error: Error?) {
        guard let transactions_ else { isLoading = false; return () }
        transactions = transactions_

        guard let credits_ else { isLoading = false; return () }
        credits = credits_

        guard let error else { isLoading = false; return () }
        print("TODO: We need to figure this out")
    }
}
