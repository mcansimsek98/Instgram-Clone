//
//  Date+Extensions.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 4.12.2024.
//

import Foundation
import Firebase


extension Timestamp {
    /// Converts a `Timestamp` to a "time ago" formatted string.
    /// - Parameter locale: The locale for the relative time format (default is English).
    /// - Returns: A string like "6 hours ago", "2 minutes ago", etc.
    func timeAgo(locale: Locale = Locale(identifier: "en")) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.locale = locale
        formatter.unitsStyle = .full
        
        let date = self.dateValue()
        
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}

