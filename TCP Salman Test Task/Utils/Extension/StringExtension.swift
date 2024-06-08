//
//  StringExtension.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//

import UIKit
extension String{
    func toAppDateFormate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormateStyle.appFormate.value
        formatter.timeZone = .current
        let date = formatter.date(from: self)
        let formater = DateFormateStyle.appShowFormate.value
        formatter.dateFormat = formater
        let dateStr = formatter.string(from: date ?? Date())
        return dateStr
    }
    func leftDays() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormateStyle.appFormate.value
        formatter.timeZone = .current
        let calendar = Calendar.current
        let currentDate = Date()
        if let date = formatter.date(from: self){
            if let daysLeft = calendar.dateComponents([.day], from: currentDate, to: date).day {
                return "\(max(daysLeft, 0))"
            }
        }
        return "0"
    }
}
