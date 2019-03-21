//
//  ViewController.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var rememberMeSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        userRememberCheck()
    }
    
    
    func userRememberCheck(){
        if let email = UserDefaults.standard.string(forKey: "userEmail"){
            usernameTextField.text = email
            if let pass = UserDefaults.standard.string(forKey: "pass"){
                passwordTextField.text = pass
                rememberMeSwitch.setOn(true, animated: false)
            }else{
                rememberMeSwitch.setOn(false, animated: false)
            }
        }
    }


    @IBAction func signInButton(_ sender: UIButton) {
        let userOrEmail = usernameTextField.text
        let password = passwordTextField.text
        if (userOrEmail!.isEmpty || userOrEmail!.contains("")){
            showAlert(title: "Error !!", message: "Please Enter Valid Email or Username")
            return
        }
        
        if (password!.isEmpty) || (password!.contains("")) {
            showAlert(title: "Error !!", message: "Please Enter Valid Password")
            return
        }
        
        if userOrEmail == "admin" || password == "admin@123"{
            let userdefault = UserDefaults.standard
            if self.rememberMeSwitch.isOn {
                userdefault.set(self.usernameTextField.text,forKey:"userEmail")
                userdefault.set(self.passwordTextField.text, forKey: "pass")
            }else{
                userdefault.removeObject(forKey: "userEmail")
                userdefault.removeObject(forKey: "pass")
            }
        }else{
            showAlert(title: "Error !!", message: "Id or password is Invalid")
            return
        }
        showStudentEntry()
    }
    
    func  showStudentEntry() {
        performSegue(withIdentifier: "student_entry", sender: nil)
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

