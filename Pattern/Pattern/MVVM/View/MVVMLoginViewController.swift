//
//  MVVMLoginViewController.swift
//  Pattern
//
//  Created by 양혜리 on 21/01/2020.
//  Copyright © 2020 양혜리. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MVVMLoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
//    let viewModel = ViewMo()
//    let viewModel = ViewModel()
    let viewModel = MVVMLoginViewModel()
    var disposeBag = DisposeBag()
    
    
//    
    @IBOutlet weak var loginButton: LeeButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        // Do any additional setup after loading the view.
    }
    
    private func bindUI() {

        idTextField.rx.text.orEmpty.subscribe(onNext: { email in
                self.viewModel.setEmailText(email)
            })
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text.orEmpty.subscribe(onNext: { email in
                self.viewModel.setPasswordText(email)
            })
            .disposed(by: disposeBag)
             
        Observable.combineLatest(viewModel.isEmailValid, viewModel.isPasswordValid) { $0 && $1 }
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)

    }
    
    @IBAction func prssedLoginButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let resultController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController,
            let userId = idTextField.text,
            let password = passwordTextField.text {
            resultController.loginInfo = LoginInfo(id: userId, password: password)
            present(resultController, animated: true, completion: nil)
        }
    }
}
