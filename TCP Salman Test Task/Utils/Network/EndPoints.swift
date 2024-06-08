//
//  EndPoints.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//

import Alamofire
import Foundation
//MARK: - Environment
enum NetworkEnvironment {
    //case dev
    case production
    //case stage
}
// MARK: - EndPointType
protocol EndPointType {
    // MARK: - Vars & Lets
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
}
// MARK: User actions
enum EndpointItem {
    case TaskList
}

// MARK: - Extensions
extension EndpointItem: EndPointType {
    var baseURL: String {
        switch APIManager.networkEnviroment {
            // Live API
        case .production: return "http://demo1414406.mockable.io/"
        }
    }
    var path: String {
        switch self {
        case .TaskList:
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
    
    var url: URL {
        switch self {
        default:
            return URL(string: self.baseURL + self.path)!
        }
    }
    
    var encoding: ParameterEncoding {
        switch httpMethod {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
}
