//
//  Authentication.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/06.
//

import Foundation

func signIn(email: String, signInAction: @escaping (Bool, String) -> Void) {
    Task {
        do {
            try await supabase.auth.signInWithOTP(
                email: email,
                redirectTo: URL(string: "com.simonferns.automa://login-callback")
            )
            signInAction(true, "Email Registered Successfully!")
        } catch {
            signInAction(false, error.localizedDescription)
        }
    }
}
