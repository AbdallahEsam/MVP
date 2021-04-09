//
//  AppDelegate.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        configWindow()
        return true
    }

   


}

extension AppDelegate {
    private func configWindow() {
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        window?.rootViewController = AuthCoordinator.login()
    }
}

