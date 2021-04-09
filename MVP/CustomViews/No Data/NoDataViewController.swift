
//  NoDataViewController.swift
//  iFresh
//
//  Created by Abdallah Esam on 8/18/20.
//  Copyright © 2021 iFresh. All rights reserved.
//

import UIKit

protocol NoDataViewControllerDelegate:class {
    func goToHomeBtnSelected()
}
class NoDataViewController: UIView {
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblTitle: UILabel!

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var homeBtn: MainButton!

    private weak var delegate:NoDataViewControllerDelegate?
    func setData(image: UIImage, description: String?,title:String,delegate:NoDataViewControllerDelegate?,buttonText:String?) {
        if let description = description , description != "" {
            lblDesc.text = description
        }
        self.delegate = delegate
        imageLogo.image = image
        lblTitle.text = title
        homeBtn.makeItEnable()
        if let buttonText = buttonText {
            homeBtn.setTitle(buttonText, for: .normal)
        }
//        fadeIn()
    }
    func fadeIn(withDuration duration: TimeInterval = 1.0) {
        imageLogo.alpha = 0
        UIView.animate(withDuration: duration, animations: {
            self.imageLogo.alpha = 1.0
        })
    }
   
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        commenInitialization()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commenInitialization()
    }

    func commenInitialization() {
        Bundle.main.loadNibNamed("NoDataView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
       
    
    }
    
    @IBAction func goHomeBtnSelected(){
        delegate?.goToHomeBtnSelected()
//        AuthService.goToHomeScreenAfterLogin()
    }
}
