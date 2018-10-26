//
//  LoginVC.swift
//  breakpoint
//
//  Created by Caleb Stultz on 7/24/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        guard let email = emailField.text, let password = passwordField.text, email != "" && password != "" else {
            return
        }
        
        AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, completion: { (success, loginError) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                print(String(describing: loginError?.localizedDescription))
            }
            
            AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, completion: { (success, registrationError) in
                if success {
                    AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, completion: { (success, nil) in
                        self.dismiss(animated: true, completion: nil)
                        print("Successfully registered user")
                    })
                } else {
                    print(String(describing: registrationError?.localizedDescription))
                }
            })
        })
    
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension LoginVC: UITextFieldDelegate { }

