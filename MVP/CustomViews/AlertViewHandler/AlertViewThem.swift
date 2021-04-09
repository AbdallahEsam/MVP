//
//  AlertViewThem.swift
//  MVP
//
//  Created by Abdallah Esam on 09/04/2021.
//

import Foundation


enum AllertThemes {
    case error
    case success
    case warning
    
    var localize: String {
        switch self {
            case .error:
                return "Error"
            case .success:
                return "Success"
            case .warning:
                return "Warning"
        }
    }
    
   
}
