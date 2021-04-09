//
//  NoInternetEnum.swift
//  MVP
//
//  Created by Abdallah Esam on 09/04/2021.
//

import UIKit
protocol NoInterNetViewModel {
    var title: String {get}
    var desc: String {get}
    var haveBtn: Bool {get}
    var btnTitle: String {get}
    var errorImage: UIImage {get}
}

enum ErrorViewType: NoInterNetViewModel {
    var title: String {
        switch self {
        case .noInternet:
            return "No Internet"
        case .timeRequestOut:
            return "time Request Out"
        case .serverError:
            return "server Error"
        }
    }
    
    var desc: String {
        switch self {
        case .noInternet:
            return "No Internet, please check your internet connection"
        case .timeRequestOut:
            return "time Request Out, please try again you connection is lost"
        case .serverError:
            return "server Error, dont worry our great team will fix it soon"
        }
    }
    
    var haveBtn: Bool {
        switch self {
        default:
            return true
        }
    }
    
    var btnTitle: String {
        switch self {
        default:
            return "Retry"
        }
    }
    
    var errorImage: UIImage {
        
        switch self {
        case .noInternet:
            return #imageLiteral(resourceName: "error")
        case .timeRequestOut:
            return #imageLiteral(resourceName: "error")
        case .serverError:
            return #imageLiteral(resourceName: "error")
        }
        
    }
    
    case noInternet
    case timeRequestOut
    case serverError
  
}
