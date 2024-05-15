//
//  PlanItem.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/13.
//

import Foundation

struct PlanItem: Identifiable, Decodable {
    let id: String
    let created_at: Date
    let price: Float
    let price_rep: String
    let base_credits: Int
    let name: String
    let popularity_score: Int
    let hex_color_int: Int
}
