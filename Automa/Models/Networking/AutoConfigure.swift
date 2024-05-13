//
//  AutoConfigure.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/13.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed
}

struct API {
    static func configureSupabase() async throws -> (supabaseURL: URL, supabaseKey: String) {
        let configURLString = "\(apiBaseUrl)/config/config_mobile_app"
        
        guard let configURL = URL(string: configURLString) else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: configURL)
        guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let supabaseURLString = json["supabase_url"] as? String,
              let supabaseKey = json["supabase_key"] as? String,
              let supabaseURL = URL(string: supabaseURLString) else {
            throw APIError.requestFailed
        }
        
        return (supabaseURL, supabaseKey)
    }
}
