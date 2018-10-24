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
        
        loginUser(withEmail: email, password: password)
        AuthService.instance.registerUser(withEmail: email, andPassword: password, completion: { (success, registrationError) in
            if success {
                self.loginUser(withEmail: email, password: password)
            } else {
                print(String(describing: registrationError?.localizedDescription))
            }
        })
    
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loginUser(withEmail email:String, password: String) {
        AuthService.instance.loginUser(withEmail: email, andPassword: password, completion: { (success, loginError) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                print(String(describing: loginError?.localizedDescription))
            }
        })
    }
}

extension LoginVC: UITextFieldDelegate { }

