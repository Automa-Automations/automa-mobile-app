//
//  HomeScreen.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/25.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 17) {
                    GenericTitle(title: "Home", description: nil, padding: nil)
                    VStack {
                        Form {
                            Section {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("my.account")
                                            .font(.body)
                                        HStack {
                                            Text("+780 Followers")
                                                .font(.caption)
                                                .foregroundColor(Color.green)
                                            Divider()
                                            Text("+19.5k likes")
                                                .font(.caption)
                                                .foregroundColor(Color.green)
                                            Divider()
                                            Text("-15 ⌘")
                                                .font(.caption)
                                                .foregroundColor(Color.red)

                                        }.padding(.top, -9)
                                    }
                                }.padding(.vertical, 6)
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("ai_doggos")
                                            .font(.body)
                                        HStack {
                                            Text("+1.78k Followers")
                                                .font(.caption)
                                                .foregroundColor(Color.green)
                                            Divider()
                                            Text("+5.8k likes")
                                                .font(.caption)
                                                .foregroundColor(Color.green)
                                            Divider()
                                            Text("-433 ⌘")
                                                .font(.caption)
                                                .foregroundColor(Color.red)

                                        }.padding(.top, -9)
                                    }
                                }.padding(.vertical, 6)
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("elon.musket")
                                            .font(.body)
                                        HStack {
                                            Text("+93 Followers")
                                                .font(.caption)
                                                .foregroundColor(Color.green)
                                            Divider()
                                            Text("+327 likes")
                                                .font(.caption)
                                                .foregroundColor(Color.green)
                                            Divider()
                                            Text("-3 ⌘")
                                                .font(.caption)
                                                .foregroundColor(Color.red)

                                        }.padding(.top, -9)
                                    }
                                }.padding(.vertical, 6)
                            } header: {
                                VStack {
                                    GenericTitle(title: nil, description: "Top Bots", padding: -20)
                                    HStack {
                                        Spacer()
                                        HStack {
                                            Text("All Bots").foregroundStyle(.brown)
                                                .textCase(.uppercase)
                                                .padding(.trailing, -15)
                                        }
                                    }
                                        
                                }
                                }.textCase(nil)
                         
                            Section {
                                CostChart()
                            } header: {
                                VStack {
                                    GenericTitle(title: nil, description: "Costs", padding: -20)
                                    HStack {
                                        Spacer()
                                        HStack {
                                            Text("Full breakdown").foregroundStyle(.brown)
                                                .textCase(.uppercase)
                                                .padding(.trailing, -15)
                                        }
                                    }
                                        
                                }
                            }.textCase(nil)
                        }
                        
                    }
                    Spacer()
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("Action")
                    }
                    ) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Exit")
                        }.accentColor(.brown)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
}
