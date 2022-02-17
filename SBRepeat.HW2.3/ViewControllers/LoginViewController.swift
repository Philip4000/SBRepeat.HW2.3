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
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userNameTF.delegate = self
        self.passwordTF.delegate = self
        
        userNameTF.tag = 0
        passwordTF.tag = 1
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else {return}
        guard let viewControllers = tabBarController.viewControllers else {return}
        for viewContorller in viewControllers {
            if let welcomeVC = viewContorller as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewContorller as? UINavigationController {
                guard let profileVC = navigationVC.topViewController as? ProfileViewController else {return}
                profileVC.user = user
            } else {
                return
            }
        }
    }
    
    @IBAction func loginButtonPressed() {
        if userNameTF.text != user.username || passwordTF.text != user.password {
            remindAlert(title: "Ooops!", message: "Wrong Username or Password. Please input correct data!")
        }
    }
    
    @IBAction func forgotUsernameButtonPressed() {
        remindAlert(title: "Forgot User Name?", message: "You Username is User")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        remindAlert(title: "Forgot Password?", message: "You password is 12345")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = nil
        passwordTF.text = nil
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
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

