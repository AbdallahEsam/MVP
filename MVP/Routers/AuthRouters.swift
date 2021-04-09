//
//  AuthRouters.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation
import Alamofire

enum AuthRouter: URLRequestConvertible {
    
    case login(body: Parameters)
    
    var method: HTTPMethod {
        switch self {
        default:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "client/auth/login"
        }
    }
    
    var parameters: [String : Any]?  {
        switch self {
        case .login(body: let body):
            return body
        }
    }
}
