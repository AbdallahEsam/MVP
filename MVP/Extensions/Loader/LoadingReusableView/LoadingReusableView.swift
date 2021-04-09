//
//  CollectionViewLoadingReusableView.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import UIKit

class LoadingReusableView: UICollectionReusableView {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.color = .mainColor
        activityIndicator.isHidden = true
        view.backgroundColor = .clear
    }
}
