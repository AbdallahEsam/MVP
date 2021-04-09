//
//  AuthCoordinator.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import UIKit
struct AuthCoordinator {
    
    static func login() ->  UIViewController{
        let network = Network()
        let mainRepo = AuthRepo(network: network)
        let view = LoginViewController()
        let presenter = LoginPresenter(view: view, repo: mainRepo)
        view.presenter = presenter
        return view
    }
    
}
