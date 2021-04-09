//
//  AuthRepo.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation
protocol AuthRepoProtocol: class {
    func login(email: String, passowrd: String, handler: @escaping (AppResponse<LoginModel>) -> Void)
}

class AuthRepo {
    
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    
}

extension AuthRepo: AuthRepoProtocol {
    
    func login(email: String, passowrd: String, handler: @escaping (AppResponse<LoginModel>) -> Void) {
        let params = ["identifier": email, "password": passowrd]
        network.request(AuthRouter.login(body: params), decodeTo: LoginModel.self, completionHandler: handler)
    }

}
