//
//  Supabase.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/03.
//

import Foundation
import Supabase

var supabase: Optional<SupabaseClient> = nil


func supabase_() async -> SupabaseClient {
    switch supabase {
    case .none:
        let (newSupabaseURL, newSupabaseKey) = try! await API.configureSupabase()
        supabase = SupabaseClient(supabaseURL: newSupabaseURL, supabaseKey: newSupabaseKey)
        return supabase!
    case .some(_):
        return supabase!
    }
}



