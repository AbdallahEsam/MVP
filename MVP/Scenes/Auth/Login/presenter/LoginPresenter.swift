//
//  LoginPresenter.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation

protocol LoginPresenterProtocol {
    func userIsTyping(email: String?, password: String?)
    func login(email: String?, password: String?)
}

class LoginPresenter {
    private weak var view: LoginViewProtocol!
    private let repo: AuthRepoProtocol
    init(view: LoginViewProtocol, repo: AuthRepoProtocol) {
        self.view = view
        self.repo = repo
    }
}

extension LoginPresenter: LoginPresenterProtocol, HandleResponseError {
    func login(email: String?, password: String?) {
        view?.startLoading()
        repo.login(email: email!, passowrd: password!) { [weak self] response in
            guard let self = self else{return}
            self.view.stopLoading()
            switch response {
                
            case .success(let data):
                AuthService.userData = data.data
                self.view.showAlert(with: data.message ?? "", title: .success)
                
            case .error(let error):
                self.handleErrorResponse(error: error, view: self.view)
            }
        }
    }
    
    func userIsTyping(email: String?, password: String?) {
        if !email.isNilOrEmpty, !password.isNilOrEmpty {
            view.enableLoginBtn()
        }else{
            view.disableLoginBtn()
        }
    }
}
