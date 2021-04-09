//
//  HandleResponseError.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation
import Alamofire

protocol HandleResponseError {
    func handleErrorResponse(error: AppError, view: HandlerErrorViewProtocol)
}

extension HandleResponseError {
    
    func handleErrorResponse( error: AppError, view: HandlerErrorViewProtocol) {
        switch error {
        case .cannotDecode:
            view.showAlert(with: error.description, title: .error)
        case .noInternet:
            view.showAlert(with: error.description, title: .error)
        case .error(let error):
            view.showAlert(with: error, title: .error)
        case .tokenExpire:
            view.showAlert(with: error.description, title: .error)
        case .internalServerError:
            view.showAlert(with: error.description, title: .error)
        case .timeOut:
            view.showAlert(with: error.description, title: .error)
        }
    }
}
