//
//  LoginViewController.swift
//  DesignPattern
//
//  Created by 양혜리 on 21/01/2020.
//  Copyright © 2020 양혜리. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var loginButton: LeeButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationView()
        // Do any additional setup after loading the view.
    }
    
    func configurationView() {
        idTextField.placeholder = "아이디를 입력해주세요"
        idTextField.tag = idTextField.hashValue
        idTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        passwordField.placeholder = "비밀번호를 입력해주세요"
        let rulesDescriptor = "allowed: upper, lower, digit; required: [$];"
        passwordField.passwordRules = UITextInputPasswordRules(descriptor: rulesDescriptor)
        passwordField.isSecureTextEntry = true
        passwordField.tag = passwordField.hashValue
        passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        loginButton.isEnabled = false
    }
    
    @IBAction func pressedLogin(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let resultController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController,
            let userId = idTextField.text,
            let password = passwordField.text {
            resultController.loginInfo = LoginInfo(id: userId, password: password)
            present(resultController, animated: true, completion: nil)
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let idTextLength = idTextField.text?.count,
            let passwordLength = passwordField.text?.count,
            idTextLength > 0,
            passwordLength > 0 {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField){
    
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.endEditing(true)
    }
    
}
