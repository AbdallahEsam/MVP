//
//  Color+.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let mainColor = UIColor(named: "MainColor")!
    static let buttonTextColorDisable = UIColor(named: "buttonTextColorDisable")
    static let disableButtonColor = UIColor(named: "disableButtonColor")
    static let enableButtonTextColor = UIColor(named: "enableButtonTextColor")
    static let mainWhiteLabel = UIColor(named: "WhiteLabel")
    static let mainBorder = UIColor(named: "mainBorder")
    static let blackLabelColor = UIColor(named: "BlackLabelColor")
    static let grayLabelColor = UIColor(named: "GrayLabelColor")
    static let bgViewColor = UIColor(named: "bgViewColor")
    
}


extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    static func hex(_ hex: String?) -> UIColor {
        var cString: String = hex?.trimmingCharacters(in: .whitespacesAndNewlines).uppercased() ?? ""
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
