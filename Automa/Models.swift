//
//  Models.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/03.
//

import Foundation
struct UpdateProfileParams: Encodable {
  let username: String
  let fullName: String
  let website: String

  enum CodingKeys: String, CodingKey {
    case username
    case fullName = "full_name"
    case website
  }
}

struct Profile: Codable {
  let username: String?
  let fullName: String?
  let website: String?
  let avatarURL: String?
  let expiry_date: Date?
  let stripe_customer_id: String?

  enum CodingKeys: String, CodingKey {
    case username
    case fullName = "full_name"
    case website
    case avatarURL = "avatar_url"
    case expiry_date
    case stripe_customer_id
  }
}


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
