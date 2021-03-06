//
//  SignInViewController.swift
//  InstagramClone
//
//  Created by Slavik on 07.08.2020.
//  Copyright © 2020 Me. All rights reserved.
//

import UIKit

class LoginInViewController: UIViewController {
    @IBOutlet var logInTextFields: [UITextField]! {
        didSet {
            for textField in logInTextFields ?? []{
                 textField.backgroundColor = UIColor.white.withAlphaComponent(0.25)
                 textField.borderStyle = .none
                 textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
                 textField.leftViewMode = .always
                 textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray5])
            }
        }
    }
    
    @IBOutlet weak var submitLogInButton: UIButton! {
        didSet {
            submitLogInButton.backgroundColor = .clear
            submitLogInButton.layer.borderWidth = 3
            submitLogInButton.layer.borderColor = UIColor.white.withAlphaComponent(0.25).cgColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Background gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.magenta.cgColor, UIColor.systemPink.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        

        
        
        
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
