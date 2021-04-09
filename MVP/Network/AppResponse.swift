//
//  AppResponse.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation
enum AppResponse <T>  {
    case success(T)
    case error(AppError)
}

enum AppError {
    case cannotDecode // Handle ComminDate
    case noInternet // ---
    case error(String) // Error.Description
    case tokenExpire // 401
    case internalServerError // 500
    case timeOut
    var description: String {
        switch self {
        
        case .cannotDecode:
            return "cannotDecode"
        case .noInternet:
            return "noInternet"
        case let .error(err):
            return err
        case .tokenExpire:
            return "tokenExpire"
        case .internalServerError:
            return "internalServerError"
        case .timeOut:
            return "timeOut"
        }
    }
}
