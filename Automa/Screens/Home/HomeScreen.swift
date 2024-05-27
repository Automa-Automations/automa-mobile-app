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
            TabView {
                VStack(spacing: 17) {
                    ScrollView(
                        showsIndicators: false) { VStack {
                            GenericTitle(title: "Home", description: nil, padding: nil)
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
                                                Text("Full breakdown").foregroundStyle(.brown).textCase(.uppercase).padding(.trailing, -15)
                                            }
                                        }
                                    }
                                }.textCase(nil)
                            }.frame(height: UIScreen.main.bounds.height * 1)
                        }
                        }

                    Spacer()
                }.tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            print("Action")
                        }
                        ) {
                            HStack {
                                Image(systemName: "chevron.left")
                                Text("Exit")
                            }.tint(.brown)
                        }
                    }
                }
                VStack {
                    GenericTitle(title: "Credits", description: nil, padding: 26)
                    
                    VStack(spacing: 35) {
                        GroupBox {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Credit balance")
                                        .font(.footnote)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                    Text("185 775,489 ⌘")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                    Button(action: {}, label: {
                                        GroupBox {
                                            Text("Buy More")
                                        }
                                    })
                                }
                                Spacer()
                            }
                        }.padding(.horizontal, 20)
                        
                        VStack {
                            GenericTitle(title: nil, description: "Transactions", padding: -1)
                            ScrollView(showsIndicators: false) {
                                ForEach(0...10, id: \.self) { _ in
                                    GroupBox {
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text("05/27/2024")
                                                    .font(.callout)
                                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                                HStack {
                                                    Spacer()
                                                    Text("-100 ⌘")
                                                        .foregroundStyle(.red)
                                                        .fontWeight(.bold)
                                                }
                                                Text("※ Image Generation")
                                                    .font(.callout)
                                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                                
                                            }
                                            Spacer()
                                        }
                                    }
                                }
                            }

                        }.padding(.horizontal, 20)
                        
                        Spacer()
                    }
                }.tint(.gray)
                    .tabItem {
                        Image(systemName: "command.square.fill")
                        Text("Credits")
                    }

                Text("New Bot")
                    .tabItem {
                        Image(systemName: "plus.app")
                        Text("New Bot")
                    }

                Text("Notifications")
                    .tabItem {
                        Image(systemName: "bell")
                        Text("Notifications")
                    }

                Text("Settings")
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }.tint(.green)
        }
    }
}

#Preview {
    HomeScreen()
}
