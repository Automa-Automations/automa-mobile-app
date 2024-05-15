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
    @State var hasAppLoaded = false

    var body: some View {
        Group {
            if !hasAppLoaded {
                ProgressView()
            } else {
                if isAuthenticated && shouldUserPayBool {
                    PlanPaymentScreen(isAuthenticated: $isAuthenticated, shouldShowPaymentScreen: $shouldUserPayBool)
                } else if isAuthenticated {
                    ProfileView()
                } else {
                    AuthScreen()
                }
            }
        }
        .task {
            do {
                
                
                for await state in await supabase_().auth.authStateChanges {
                    if [.initialSession, .signedIn, .signedOut].contains(state.event) {
                        isAuthenticated = state.session != nil
                        if isAuthenticated {
                            shouldUserPayBool = await shouldUserPay()
                        }
                        hasAppLoaded = true
                    }
                }
            } catch {
                print("Error configuring Supabase: \(error)")
            }
        }
    }

    func shouldUserPay() async -> Bool {
        do {
            let currentUser = try await supabase_().auth.session.user
            let userId = currentUser.id

            let profile: Profile = try await supabase_().database
                .from("profiles")
                .select()
                .eq("id", value: userId)
                .single()
                .execute()
                .value

            let currentTimeStamp = Date().timeIntervalSince1970
            if profile.expiry_date == nil {
                return false
            }

            if profile.expiry_date?.timeIntervalSince1970 ?? Double(0.0) < currentTimeStamp {
                return true
            }

        } catch {
            print("Something")
        }
        return false
    }
}
