//
//  SignUpViewController.swift
//  InstagramClone
//
//  Created by Slavik on 08.08.2020.
//  Copyright © 2020 Me. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    @IBOutlet var signUpTextFields: [UITextField]! {
        didSet {
            for textField in signUpTextFields ?? []{
                 textField.backgroundColor = UIColor.white.withAlphaComponent(0.25)
                 textField.borderStyle = .none
                 textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
                 textField.leftViewMode = .always
                 textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray5])
            }
        }
    }
    
    @IBOutlet weak var submitSignUpButton: UIButton! {
        didSet {
            submitSignUpButton.backgroundColor = .clear
            submitSignUpButton.layer.borderWidth = 3
            submitSignUpButton.layer.borderColor = UIColor.white.withAlphaComponent(0.25).cgColor
            submitSignUpButton.isHidden = true
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
        
        handleTextField()
    }
    
    func handleTextField() {
        for tf in signUpTextFields {
            tf.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let username = signUpTextFields[0].text, !username.isEmpty,
              let email = signUpTextFields[1].text, !email.isEmpty,
              let password = signUpTextFields[2].text, !password.isEmpty,
              let applyPassword = signUpTextFields[3].text, !applyPassword.isEmpty
        else {
            
            submitSignUpButton.isHidden = true
            print("not valid")
            return
        }
        
        submitSignUpButton.isHidden = false
        
        
        
    }
    
    @IBAction func dismisOnClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpButton_OnClick(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: signUpTextFields[1].text!, password: signUpTextFields[3].text!, completion: { user, error in
            
            if error != nil {
                print(error!.localizedDescription)
                return
            }
                
            let ref = Database.database().reference()
            let usersRef = ref.child("users")
            let uid = user?.user.uid
            let newUserRef = usersRef.child(uid!)
            newUserRef.setValue(["username": self.signUpTextFields[0].text,
                                 "email": self.signUpTextFields[1].text])
            print(newUserRef.description())
            
        })
    }
    
}
