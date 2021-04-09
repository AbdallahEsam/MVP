//
//  AppErrorViewsProtocol.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//
import UIKit

protocol AppErrorViewsProtocol {
    func showNoInternetView(show: Bool, deleget: NoInternetDelegate?)
    func showTimeRequestOutView(show: Bool, deleget: NoInternetDelegate?)
    func showServerErrorView(show: Bool, deleget: NoInternetDelegate?)
}

extension AppErrorViewsProtocol where Self: UIViewController {
    
    func showNoInternetView(show: Bool, deleget: NoInternetDelegate?) {
        self.showNoInterNetView(show: show, deleget: deleget, errorType: .noInternet)
    }
    
    func showTimeRequestOutView(show: Bool, deleget: NoInternetDelegate?, mainView:UIView?) {
        self.showNoInterNetView(show: show, deleget: deleget, errorType: .timeRequestOut)
    }
    
    func showServerErrorView(show: Bool, deleget: NoInternetDelegate?, mainView:UIView?){
        self.showNoInterNetView(show: show, deleget: deleget, errorType: .serverError)
    }
    
}

