//
//  SignOutToolbar.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/07.
//

import Foundation
import SwiftUI

struct SignOutToolbar: ToolbarContent {
    @Binding var isAuthenticated: Bool
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    signOut {
                        isAuthenticated = false
                        
                        if !$0 {
                            print("REMEMBER TO ADD THE POPUP HERE! \($1)")
                        }
                    }
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Sign Out")
                    }.accentColor(.brown)
                }
            }
            }
}
