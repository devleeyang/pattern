//
//  MVVMLoginViewModel.swift
//  Pattern
//
//  Created by leeyang on 21/01/2020.
//  Copyright © 2020 양혜리. All rights reserved.
//

import Foundation
import RxSwift

struct MVVMLoginViewModel {
    
    let isEmailValid = BehaviorSubject(value: false)
    let isPasswordValid = BehaviorSubject(value: false)
    
    func setEmailText(_ email:String) {
        let isValid = checkEmailValid(email)
        isEmailValid.onNext(isValid)
    }
    
    func setPasswordText(_ password:String) {
        let isValid = checkPasswordValid(password)
        isPasswordValid.onNext(isValid)
    }
    
    private func checkEmailValid(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
     
    private func checkPasswordValid(_ password: String) -> Bool {
        return password.count > 5
    }
}
