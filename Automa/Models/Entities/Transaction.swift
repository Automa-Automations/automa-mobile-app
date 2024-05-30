//
//  File.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/30.
//

import Foundation

struct Transaction {
    let id: String
    let created_at: Date
    let credits: Int
    let head: String
    let metadata: [String: Any]
    let user_id: String
}

