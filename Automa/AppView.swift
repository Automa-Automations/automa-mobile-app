//
//  AppView.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/03.
//

import Foundation
import SwiftUI
struct AppView: View {
    @State var isAuthenticated = false
    @State var shouldUserPayBool = false

    var body: some View {
        Group {
            if isAuthenticated && shouldUserPayBool {
                Text("Pay View")
            } else if isAuthenticated {
                ProfileView()
            } else {
                AuthScreen()
            }
        }
        .task {
            for await state in await supabase.auth.authStateChanges {
                if [.initialSession, .signedIn, .signedOut].contains(state.event) {
                    isAuthenticated = state.session != nil
                    if isAuthenticated {
                        shouldUserPayBool = await shouldUserPay()
                    }
                }
            }
        }
    }

    func shouldUserPay() async -> Bool {
        do {
            let currentUser = try await supabase.auth.session.user
            let userId = currentUser.id

            let profile: Profile = try await supabase.database
                .from("profiles")
                .select()
                .eq("id", value: userId)
                .single()
                .execute()
                .value

            let currentTimeStamp = Int(Date().timeIntervalSince1970)
            if profile.expiryDate < currentTimeStamp {
                return true
            }

        } catch {
            print("Something")
        }
        return false
    }
}
