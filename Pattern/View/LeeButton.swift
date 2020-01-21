//
//  LeeButton.swift
//  DesignPattern
//
//  Created by 양혜리 on 21/01/2020.
//  Copyright © 2020 양혜리. All rights reserved.
//

import UIKit

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        self.setBackgroundImage(backgroundImage, for: state)
    }
}

class LeeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setBackgroundColor(.blue, for: .normal)
        setBackgroundColor(.gray, for: .disabled)
        setTitle("로그인", for: .normal)
        setTitle("로그인", for: .disabled)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
