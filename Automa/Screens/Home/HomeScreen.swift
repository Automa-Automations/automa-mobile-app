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
                // Homescreen
                Home()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }

                // Credits
                Credits()
                    .tabItem {
                        Image(systemName: "command.square.fill")
                        Text("Credits")
                    }

                // Create Bot View
                CreateBot()
                    .tabItem {
                        Image(systemName: "plus.app")
                        Text("New Bot")
                    }
                // Notifications
                Notifications_()
                    .tabItem {
                        Image(systemName: "bell")
                        Text("Notifications")
                    }
                // Settings
                Settings_()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }.tint(.green)
        }
    }
}

struct Home: View {
    var body: some View {
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
    }
}

struct Credits: View {
    let model: PaymentSheetModel = PaymentSheetModel()
    @State var isBuyCredits: Bool = false
    
    var body: some View {
         NavigationStack {
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
                                        
                                Button(action: {isBuyCredits.toggle()}) {
                                    GroupBox {
                                        Text("Buy more")
                                    }.tint(.white)
                                }.contextMenu(ContextMenu(menuItems: {
                                    Text("Buy 100 Credits")
                                    Text("Buy 500 Credits")
                                    Text("Buy 1000 Credits")
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
                        ScrollView(showsIndicators: false) {
                            ForEach(0 ... 10, id: \.self) { _ in
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
                .sheet(isPresented: $isBuyCredits) {
                    NavigationStack {
                        VStack {
                            HStack {
                                GroupBox {
                                    Button(action: {}) {
                                        Image(systemName: "command.square.fill")
                                        Text("500 Credits")
                                        Spacer()
                                        
                                    }
                                }
                                
                                GroupBox {
                                    Button(action: {
                                        }) {
                                            Image(systemName: "command.square.fill")
                                            Text("1000 Credits")
                                            Spacer()
                                        }
                                }
                            }
                            
                            GroupBox {
                                Button(action: {}) {
                                    Image(systemName: "plus.square.fill")
                                    Text("Custom Amount")
                                    Spacer()
                                }
                            }
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
    }
}

struct CreateBot: View {
    var body: some View {
        VStack(alignment: .leading) {
            GenericTitle(title: "Create a bot", description: nil, padding: nil)
            VStack(alignment: .leading, spacing: 20) {
                TabView {
                    GroupBox {
                        VStack(spacing: 15) {
                            HStack(alignment: .top) {
                                Image("cute-animal-generator-temp")
                                Spacer()
                                Text("Trending Now")
                                    .font(.footnote)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                            HStack {
                                Text("Podcast Bot")
                                    .fontWeight(.bold)
                                    .font(.subheadline)
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundStyle(.green)
                                Spacer()
                            }
                        }
                        Spacer()
                        VStack(spacing: 20) {
                            HStack {
                                Text("An automation workflow that will generate cute animal images, and automatically post them on instagram.")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                Spacer()
                            }
                        }

                        HStack {
                            Image("logo-temp")
                            Text("Automa")
                                .font(.caption)

                            Spacer()

                            HStack {
                                Image(systemName: "heart")
                                    .font(.caption)
                                    .padding(.trailing, -3)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                Text("4.3k")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                            HStack {
                                Image(systemName: "plus.square.fill")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                    .padding(.trailing, -3)
                                Text("7.5m")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                        }
                    }.padding(.horizontal, 20)

                    GroupBox {
                        VStack(spacing: 15) {
                            HStack(alignment: .top) {
                                Image("cute-animal-generator-temp")
                                Spacer()
                                Text("Trending Now")
                                    .font(.footnote)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                            HStack {
                                Text("Bot2")
                                    .fontWeight(.bold)
                                    .font(.subheadline)
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundStyle(.green)
                                Spacer()
                            }
                        }
                        Spacer()
                        VStack(spacing: 20) {
                            HStack {
                                Text("An automation workflow that will generate cute animal images, and automatically post them on instagram.")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                Spacer()
                            }
                        }

                        HStack {
                            Image("logo-temp")
                            Text("Automa")
                                .font(.caption)

                            Spacer()

                            HStack {
                                Image(systemName: "heart")
                                    .font(.caption)
                                    .padding(.trailing, -3)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                Text("4.3k")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                            HStack {
                                Image(systemName: "plus.square.fill")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                    .padding(.trailing, -3)
                                Text("7.5m")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                        }
                    }.padding(.horizontal, 20)
                    GroupBox {
                        VStack(spacing: 15) {
                            HStack(alignment: .top) {
                                Image("cute-animal-generator-temp")
                                Spacer()
                                Text("Trending Now")
                                    .font(.footnote)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                            HStack {
                                Text("Cute Animals Generator")
                                    .fontWeight(.bold)
                                    .font(.subheadline)
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundStyle(.green)
                                Spacer()
                            }
                        }
                        Spacer()
                        VStack(spacing: 20) {
                            HStack {
                                Text("An automation workflow that will generate cute animal images, and automatically post them on instagram.")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                Spacer()
                            }
                        }

                        HStack {
                            Image("logo-temp")
                            Text("Automa")
                                .font(.caption)

                            Spacer()

                            HStack {
                                Image(systemName: "heart")
                                    .font(.caption)
                                    .padding(.trailing, -3)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                Text("4.3k")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                            HStack {
                                Image(systemName: "plus.square.fill")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                    .padding(.trailing, -3)
                                Text("7.5m")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                        }
                    }.padding(.horizontal, 20)
                }.tabViewStyle(.page(indexDisplayMode: .always))
                    .frame(height: 200)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        GroupBox {
                            VStack(spacing: 15) {
                                HStack(alignment: .top) {
                                    Image("cute-animal-generator-temp")
                                    Spacer()
                                }
                                HStack {
                                    Text("Instagram")
                                        .fontWeight(.bold)
                                        .font(.subheadline)
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundStyle(.green)
                                    Spacer()
                                }
                            }

                            Spacer().frame(height: 30)
                            VStack(spacing: 20) {
                                HStack {
                                    Text("A Instagram bot.")
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                    Spacer()
                                }
                            }

                            HStack {
                                Image("logo-temp")
                                Text("Automa")
                                    .font(.caption)

                                Spacer()

                                HStack {
                                    Image(systemName: "heart")
                                        .font(.caption)
                                        .padding(.trailing, -3)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                    Text("4.3k")
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                }
                            }
                        }
                        .frame(width: 170)

                        GroupBox {
                            VStack(spacing: 15) {
                                HStack(alignment: .top) {
                                    Image("cute-animal-generator-temp")
                                    Spacer()
                                }
                                HStack {
                                    Text("Instagram")
                                        .fontWeight(.bold)
                                        .font(.subheadline)
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundStyle(.green)
                                    Spacer()
                                }
                            }

                            Spacer().frame(height: 30)
                            VStack(spacing: 20) {
                                HStack {
                                    Text("A Instagram bot.")
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                    Spacer()
                                }
                            }

                            HStack {
                                Image("logo-temp")
                                Text("Automa")
                                    .font(.caption)

                                Spacer()

                                HStack {
                                    Image(systemName: "heart")
                                        .font(.caption)
                                        .padding(.trailing, -3)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                    Text("4.3k")
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                }
                            }
                        }
                        .frame(width: 170)
                        GroupBox {
                            VStack(spacing: 15) {
                                HStack(alignment: .top) {
                                    Image("cute-animal-generator-temp")
                                    Spacer()
                                }
                                HStack {
                                    Text("Instagram")
                                        .fontWeight(.bold)
                                        .font(.subheadline)
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundStyle(.green)
                                    Spacer()
                                }
                            }

                            Spacer().frame(height: 30)
                            VStack(spacing: 20) {
                                HStack {
                                    Text("Create an instagram bot.")
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                    Spacer()
                                }
                            }

                            HStack {
                                Image("logo-temp")
                                Text("Automa")
                                    .font(.caption)

                                Spacer()

                                HStack {
                                    Image(systemName: "heart")
                                        .font(.caption)
                                        .padding(.trailing, -3)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                    Text("4.3k")
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                }
                            }
                        }
                        .frame(width: 170)
                    }
                }.padding(.leading, 20)
            }
            HStack {
                GroupBox {
                    HStack(spacing: 15) {
                        HStack(alignment: .top) {
                            Image("podcast-temp")
                        }
                        HStack {
                            Text("PodClip")
                                .fontWeight(.bold)
                                .font(.subheadline)
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.green)
                            Spacer()
                        }
                    }
                }
                GroupBox {
                    HStack(spacing: 15) {
                        HStack(alignment: .top) {
                            Image("podcast-temp")
                        }
                        HStack {
                            Text("PodClip")
                                .fontWeight(.bold)
                                .font(.subheadline)
                            Spacer()
                        }
                    }
                }
            }.padding(.horizontal, 20)
            GroupBox {
                HStack(spacing: 15) {
                    HStack(alignment: .top) {
                        Image(systemName: "plus.square.fill")
                            .font(.title)
                            .foregroundStyle(Color(hex: 0x8E8E93))
                    }
                    HStack {
                        Text("Create custom bot")
                            .fontWeight(.bold)
                            .font(.subheadline)
                        Spacer()
                    }
                }

            }.padding(.horizontal, 20)

            Spacer()
        }
    }
}

struct Notifications_: View {
    var body: some View {
        VStack(spacing: 30) {
            GenericTitle(title: "Notifications", description: nil, padding: nil)
            GroupBox {
                Toggle("Should we send notifications?", isOn: .constant(false))
            }.padding(.horizontal, 20)

            VStack {
                GenericTitle(title: nil, description: "Notifications", padding: nil)
                ScrollView(showsIndicators: false) {
                    ForEach(0 ... 10, id: \.self) { _ in
                        GroupBox {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("※ Image Generation")
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                    Text("😳 Bots are using 70% more credits than usual.").font(.footnote)
                                }
                                Spacer()
                            }
                        }
                    }
                }.padding(.horizontal, 20)
            }
            Spacer()
        }
    }
}

struct Settings_: View {
    var body: some View {
        Text("Coming Soon")
    }
}

#Preview {
    Credits()
}

