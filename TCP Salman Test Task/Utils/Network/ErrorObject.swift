//
//  ErrorObject.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//

import UIKit

struct AlertMessage {
    var title = "Oops!"
    var body = "Something went wrong."
}

class ErrorObject: Codable {
    
    let message: String
    let key: String?
    
}
