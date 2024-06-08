//
//  ApiManager.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//

import UIKit
import Alamofire
class APIManager {
    // MARK: - Vars & Lets
    private let sessionManager: Session
    static let networkEnviroment: NetworkEnvironment = .production
    private static var sharedApiManager: APIManager = {
        let apiManager = APIManager(sessionManager: Session())
        return apiManager
    }()
    
    // MARK: - Accessors
    class func shared() -> APIManager {
        return sharedApiManager
    }
    
    // MARK: - Initialization
    private init(sessionManager: Session) {
        self.sessionManager = sessionManager
        self.sessionManager.sessionConfiguration.timeoutIntervalForRequest = 10
    }
    
    func call<T: Codable>(type: EndPointType, params: Parameters? = nil, handler: @escaping (T?, _ error: AlertMessage?)->()) {
        
        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: params,
                                    encoding: type.encoding,
                                    headers: type.headers)
        .responseDecodable(of: T.self) { data in
            switch data.result {
            case .success(_):
                self.showRequestDetailForSuccess(responseObject: data)
                let response = try? data.result.get()
                handler(response, nil)
                break
            case .failure(let error):
                self.showRequestDetailForFailure(responseObject: data)
                print(error.localizedDescription)
                print(error)
                handler(nil, AlertMessage(title: "Oops!", body: error.localizedDescription))
                break
            }
        }
    }
    
    //MARK: - Print reponse in style
    //TODO: remove code when going to produciton
    func showRequestDetailForSuccess<T: Codable>(responseObject response : DataResponse<T, AFError>) {
        //        #if DEBUG
        print("\n\n\n📲📲📲📲📲 ------- Success Response Start ------- 📲📲📲📲📲\n")
        print(""+(response.request?.url?.absoluteString ?? ""))
        print("\n=========   allHTTPHeaderFields   ========== \n")
        print("%@",response.request!.allHTTPHeaderFields!)
        print("\n=========   Request Type   ========== \n")
        print("%@",response.request?.httpMethod?.description ?? "")
        if let bodyData : Data = response.request?.httpBody {
            let bodyString = String(data: bodyData, encoding: String.Encoding.utf8)
            print("\n=========   Request httpBody   ========== \n" + (bodyString ?? ""))
        } else {
            print("\n=========   Request httpBody   ========== \n" + "Found Request Body Nil")
        }
        if let responseData : Data = response.data {
            let responseString = String(data: responseData, encoding: String.Encoding.utf8)
            print("\n=========   Response Body   ========== \n" + (responseString ?? ""))
        } else {
            print("\n=========   Response Body   ========== \n" + "Found Response Body Nil")
        }
        print("\n📲📲📲📲📲 ------- Success Response End ------- 📲📲📲📲📲\n\n\n")
        //        #endif
    }
    
    func showRequestDetailForFailure<T: Codable>(responseObject response : DataResponse<T, AFError>) {
        //        #if DEBUG
        print("\n\n\n📵📵📵📵📵 ------- Failure Response Start ------- 📵📵📵📵📵\n")
        print(""+(response.request?.url?.absoluteString ?? ""))
        print("\n=========   allHTTPHeaderFields   ========== \n")
        print("%@",response.request?.allHTTPHeaderFields ?? "")
        print("\n=========   Request Type   ========== \n")
        print("%@",response.request?.httpMethod?.description ?? "")
        if let bodyData : Data = response.request?.httpBody {
            let bodyString = String(data: bodyData, encoding: String.Encoding.utf8)
            print("\n=========   Request httpBody   ========== \n" + (bodyString ?? ""))
        } else {
            print("\n=========   Request httpBody   ========== \n" + "Found Request Body Nil")
        }
        if let responseData : Data = response.data {
            let responseString = String(data: responseData, encoding: String.Encoding.utf8)
            print("\n=========   Response Body   ========== \n" + (responseString ?? ""))
        } else {
            print("\n=========   Response Body   ========== \n" + "Found Response Body Nil")
        }
        print("\n=========   Error  ========== \n" + (response.error.debugDescription ))
        print("\n📵📵📵📵📵 ------- Failure Response End ------- 📵📵📵📵📵\n\n\n")
        //        #endif
    }
}
