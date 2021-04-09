//
//  AlertViewHandler.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import UIKit
import AVFoundation

class AlertViewHandler {
    
     var window = AppDelegate.shared.window!
    
    func showAlert(message: String, title: AllertThemes) {
        
      
        let view = AlertView(message: message, title: title)
       
        for view in self.window.subviews {
            if let subView = view as? AlertView{
                if  subView.type.localize == title.localize , subView.message == message {
                    UIView.animate(withDuration: 0.5) {
                        subView.removeFromSuperview()
                    }
                    break

                }else{
                    UIView.animate(withDuration: 0.5) {
                        subView.removeFromSuperview()
                    }
                    break
                }
                
            }
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        window.addSubview(view)
        let height:CGFloat =  window.frame.maxY * 0.8 > 650 ? 107  : 90
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: window.topAnchor, constant: 0),
            view.leadingAnchor.constraint(equalTo: window.leadingAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: 0),
            view.heightAnchor.constraint(equalToConstant:height)
        ])
        view.layout()
        
    }
}
