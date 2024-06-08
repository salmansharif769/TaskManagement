//
//  DateAndCalenderExtension.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//

import UIKit
extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from) // <1>
        let toDate = startOfDay(for: to) // <2>
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate) // <3>
        return numberOfDays.day!
    }
}
enum DateFormateStyle {
    case appFormate, appShowFormate
    var value: String {
        switch self {
        case .appFormate:
            return "yyyy-MM-dd"
        case .appShowFormate:
            return "MMM dd yyyy"
        }
    }
}
extension Date {
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    func string(with format: DateFormateStyle) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.value
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.string(from: self)
    }
}
