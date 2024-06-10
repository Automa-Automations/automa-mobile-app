//
//  File.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/30.
//

import Foundation

struct Transaction: Hashable, Equatable {
    let id: String
    let created_at: Date
    let credits: Int
    let head: String
    let metadata: [String: Any]
    let user_id: String
    
    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        return lhs.id == rhs.id &&
               lhs.created_at == rhs.created_at &&
               lhs.credits == rhs.credits &&
               lhs.head == rhs.head &&
               lhs.user_id == rhs.user_id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(created_at)
        hasher.combine(credits)
        hasher.combine(head)
        hasher.combine(user_id)
    }
}
