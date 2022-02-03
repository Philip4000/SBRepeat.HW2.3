//
//  ViewController.swift
//  SBRepeat.HW2.3
//
//  Created by Philip Noskov on 03.02.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let username = "Philip"
    private let password = "12345"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userNameTF.delegate = self
        self.passwordTF.delegate = self
        
        userNameTF.tag = 0
        passwordTF.tag = 1
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        welcomeVC.userName = username
    }
    
    @IBAction func loginButtonPressed() {
        if userNameTF.text != "Philip", passwordTF.text != "12345" {
            remindAlert(title: "Wrong", message: "Wrong Username or Password. Please input correct data!")
        }
    }
    
    @IBAction func forgotUsernameButtonPressed() {
        remindAlert(title: "Forgot Username?", message: "You Username is User")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        remindAlert(title: "Forgot Password?", message: "You password is Password")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let _ = segue.source as? WelcomeViewController else {return}
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.tagBasedTextField(textField)
        return true
    }
    
    private func tagBasedTextField(_ textField: UITextField) {
        let nextTextFieldTag = textField.tag + 1
        
        if let nextTextField = textField.superview?.viewWithTag(nextTextFieldTag) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            self.loginButtonPressed()
            performSegue(withIdentifier: "go", sender: nil)
        }
    }
    

}

// MARK: - Extensions
extension LoginViewController {
    private func remindAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTF.text = ""
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

