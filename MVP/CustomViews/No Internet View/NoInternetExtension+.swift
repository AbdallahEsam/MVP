//
//  NoInternetExtension+.swift
//  MVP
//
//  Created by Abdallah Esam on 09/04/2021.
//

import UIKit

extension UIViewController {
    
    func showNoInterNetView(show: Bool, deleget: NoInternetDelegate?, errorType: ErrorViewType, mainView:UIView? = nil) {
        let noInternetview = NoInterNetView(frame: .zero, error:errorType)
        let tag = 404
        let view:UIView = mainView ?? self.view
        if show {
            if (view.viewWithTag(tag) as? NoInterNetView) != nil {
                return
            }
            noInternetview.delegate = deleget
            noInternetview.tag = tag
            noInternetview.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(noInternetview) // or use  webView.addSubview(activityIndicator)
            NSLayoutConstraint.activate([
                noInternetview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                noInternetview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                noInternetview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                noInternetview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            ])
        } else {
            if let noInternetview = view.viewWithTag(tag) as? NoInterNetView {
                noInternetview.removeFromSuperview()
            }
        }
    }
    
}
