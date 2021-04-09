//
//  AlertHandlerViewProtocol.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import UIKit

protocol AlertHandlerViewProtocol {
    func showAlert(with message: String, title: AllertThemes)
}

extension AlertHandlerViewProtocol where Self: UIViewController {
    func showAlert(with message: String, title: AllertThemes) {
        AlertViewHandler().showAlert(message: message, title: title)
    }
}

