//
//  MVPLoginViewController.swift
//  Pattern
//
//  Created by leeyang on 21/01/2020.
//  Copyright © 2020 양혜리. All rights reserved.
//

import UIKit

protocol LoginViewControllerType: AnyObject {
    func didSelectLogin()
}
class MVPLoginViewController: UIViewController {
    
    var presenter: LoginPresenterType?
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var lgoinButton: LeeButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationView()
        // Do any additional setup after loading the view.
    }
    
    func configurationView() {
        presenter = LoginPresenter(view: self)
        idTextField.placeholder = "아이디를 입력해주세요"
        idTextField.tag = idTextField.hashValue
        idTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        passwordTextField.placeholder = "비밀번호를 입력해주세요"
        let rulesDescriptor = "allowed: upper, lower, digit; required: [$];"
        passwordTextField.passwordRules = UITextInputPasswordRules(descriptor: rulesDescriptor)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.tag = passwordTextField.hashValue
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        lgoinButton.isEnabled = false
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let idTextLength = idTextField.text?.count,
            let passwordLength = passwordTextField.text?.count,
            idTextLength > 0,
            passwordLength > 0 {
            lgoinButton.isEnabled = true
        } else {
            lgoinButton.isEnabled = false
        }
    }
    
    @IBAction func pressedLogin(_ sender: UIButton) {
        didSelectLogin()
    }
}

extension MVPLoginViewController: LoginViewControllerType {

    func didSelectLogin() {
        if let isEmail = presenter?.isEmailValid(idTextField.text!),
            let isPassword = presenter?.isPasswordValid(passwordTextField.text!),
            let presenter = presenter,
            isEmail && isPassword {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let resultController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
                resultController.loginInfo = LoginInfo(id: presenter.userId, password: presenter.userPassword)
                present(resultController, animated: true, completion: nil)
            }
        }
    }
}
