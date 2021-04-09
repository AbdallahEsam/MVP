//
//  LoginViewController.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import UIKit
protocol LoginViewProtocol: LoaderViewProtocol, AlertHandlerViewProtocol {
    func enableLoginBtn()
    func disableLoginBtn()
}

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn:MainButton!
    
    var presenter: LoginPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        [emailTF, passwordTF].forEach({$0?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)})
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTF.becomeFirstResponder()
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        presenter.userIsTyping(email: emailTF.text, password: passwordTF.text)
    }
    
    @IBAction func loginBtnSelected() {
        view.endEditing(true)
        presenter.login(email: emailTF.text, password: passwordTF.text)
    }
}

extension LoginViewController: LoginViewProtocol {
    
    func startLoading() {
        loginBtn.showLoading(true)
    }
    
    func stopLoading() {
        loginBtn.showLoading(false)
    }
    
    func enableLoginBtn() {
        loginBtn.makeItEnable()
    }
    
    func disableLoginBtn() {
        loginBtn.makeitDisaple()
    }
    
}
