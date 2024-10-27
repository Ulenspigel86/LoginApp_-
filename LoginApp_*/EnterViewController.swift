//
//  EnterViewController.swift
//  LoginApp_*
//
//  Created by Артем Иванов on 25.10.2024.
//

import UIKit

final class EnterViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    let loginUser = "Admin"
    let loginPassword = "Admin"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let userVC = segue.destination as? UserViewController
        userVC?.user = loginUser
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifire: String, sender: Any?) -> Bool {
        guard userNameTF.text == loginUser, passwordTF.text == loginPassword else {
            showAlert(
                withTitle: "Ivalid login or password",
                andMessage: "Please enter valid login and Password") {
                    self.passwordTF.text = ""
                }
            return false
        }
        return true
    }
    
    @IBAction func forgotUserData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(withTitle: "Аttention!", andMessage: "Your login is \(loginUser)")
        : showAlert(withTitle: "Аttention!", andMessage: "Your password is \(loginPassword)")
    }
    
    @IBAction func inwind(for segue: UIStoryboardSegue){
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    func showAlert(withTitle title: String, andMessage message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController (
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) {
            _ in completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}



