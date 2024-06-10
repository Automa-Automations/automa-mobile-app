//
//  Supabase.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/03.
//

import Foundation
import Supabase

var supabase: Optional<SupabaseClient> = nil

var userId: Optional<String> = nil

func supabase_() async -> SupabaseClient {
    switch supabase {
    case .none:
        let (newSupabaseURL, newSupabaseKey) = try! await API.configureSupabase()
        supabase = SupabaseClient(supabaseURL: newSupabaseURL, supabaseKey: newSupabaseKey)
        return supabase!
    case .some:
        return supabase!
    }
}

func userId_() async -> String {
    switch userId {
    case .none:
        let client = await supabase_()
        userId = try! await client.auth.user().id.uuidString
    case .some:
        return userId!
    }
    return userId!
}
