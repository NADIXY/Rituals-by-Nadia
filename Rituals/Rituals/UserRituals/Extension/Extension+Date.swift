//
//  Extension+Date.swift
//  Rituals
//
//  Created by Nadia on 17.09.24.
//

import Foundation

extension Date {
    static func fromString(_ dateString: String, format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from: dateString) {
            return date
        }
        return nil
    }
}

