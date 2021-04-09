//
//  Configration.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation
enum Configuration {
    
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }
    
    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }
        
        switch object {
            case let value as T:
                return value
            case let string as String:
                guard let value = T(string) else { fallthrough }
                return value
            default:
                throw Error.invalidValue
        }
    }
}

enum ConstantsEnum {
    static var baseURL: String {
        return Constants.baseUrlKey + "/api/" //Configuration.value(for: Constants.baseUrlKey)
    }
}


struct Constants {
    static let baseUrlKey = "https://realplaza.o.aait-d.com"
    static var responseValid = "true"
    
}
