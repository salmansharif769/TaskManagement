//
//  TaskListServices.swift
//  Future Event
//
//  Created by evento on 01/01/2023.
//

import UIKit
struct TaskListServices {
    static func getTastList(handler: @escaping (_ user: BaseResponse<[Task]>?, _ error: AlertMessage?)->()) {
        APIManager.shared().call(type: EndpointItem.TaskList, params: [:]) { (response: BaseResponse<[Task]>?, message: AlertMessage?) in
            if let response = response {
                handler(response, nil)
            } else {
                handler(nil, message!)
            }
        }
    }
}
struct BaseResponse<T: Codable> : Codable {
    let response : T?
    
    enum CodingKeys: String, CodingKey {
        case response = "tasks"
    }
}
//Salman Code
