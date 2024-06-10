//
//  DateFromPostgresTimestamp.swift
//  Automa
//
//  Created by Simon Ferns on 2024/06/10.
//

import Foundation

extension Date {
    static func fromTimestampz(_ dateString: String) -> Date? {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [
            .withInternetDateTime,
            .withFractionalSeconds
        ]
        let date = isoFormatter.date(from: dateString)
        return date
    }
}

