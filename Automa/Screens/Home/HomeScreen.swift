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
                                    
                                }
                                HStack {
                                    
                                }
                                HStack {
                                    
                                }
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
