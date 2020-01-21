//
//  MVPLoginPresenter.swift
//  Pattern
//
//  Created by leeyang on 21/01/2020.
//  Copyright © 2020 양혜리. All rights reserved.
//

import Foundation

protocol LoginPresenterType {
    var userId: String {get}
    var userPassword: String {get}
    func isEmailValid(_ email: String) -> Bool
    func isPasswordValid(_ password: String) -> Bool
}

final class LoginPresenter: LoginPresenterType {
    private weak var view: LoginViewControllerType?
    
    private(set) var userId: String = ""
    private(set) var userPassword: String = ""
    
    init(view: LoginViewControllerType) {
        self.view = view
    }
}

extension LoginPresenter {
    func isEmailValid(_ email: String) -> Bool {
        userId = email
        return email.contains("@") && email.contains(".")
    }
       
    func isPasswordValid(_ password: String) -> Bool {
        userPassword = password
        return password.count > 5
    }
}
