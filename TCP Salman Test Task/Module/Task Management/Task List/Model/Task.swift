//
//  Task.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//

import Foundation
struct Task: Codable {
    let id, targetDate: String?
    let dueDate: String?
    let title, description: String?
    let priority: Int?
    var status: TaskStatus = .UnResolvedDefault

    enum CodingKeys: String, CodingKey {
        case id
        case targetDate = "TargetDate"
        case dueDate = "DueDate"
        case title = "Title"
        case description = "Description"
        case priority = "Priority"
    }
}

enum TaskStatus: String{
    case UnResolved
    case Resolved
    case UnResolvedDefault
}
