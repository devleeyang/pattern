//
//  MainViewController.swift
//  DesignPattern
//
//  Created by 양혜리 on 21/01/2020.
//  Copyright © 2020 양혜리. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var loginInfo: LoginInfo?
    @IBOutlet weak var idLabel: UILabel!
    
    private(set) lazy var userIdInfo: String = {
        return (loginInfo?.id ?? "")
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idLabel.text = userIdInfo
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
