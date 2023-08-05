//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Никита on 04.08.2023.
//

import UIKit
// спросить должна ли нажиматься кнопка "Forgot password" в любом случае
final class MainViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let userName = "11"
    private let password = "22"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.welcomeUserName = userNameTextField.text
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == userName, passwordTextField.text == password else {
            showAlert(withTitle: "Invalid login or password", andMessage: "Please, enter correct login and password")
            return false
        }
        return true
    }
    
    @IBAction func logInButtonTapped() {
        //Можно было вот так по школьному сделать?)
        /*if !((userNameTextField.text == userName) && (passwordTextField.text == password)) {
            showAlert(withTitle: "Invalid login or password", andMessage: "Please, enter correct login and password")
        }*/
    }
    @IBAction func userInfoTapped() {
        guard let inputText = userNameTextField.text,  inputText == userName else  {
            showAlert(withTitle: "Ooops!", andMessage: "Your name is \(userName)😜")
            return
        }
    }
    @IBAction func passwordInfoTapped() {
        guard let inputText = passwordTextField.text, inputText == password else {
            showAlert(withTitle: "Oooops!", andMessage: "Your password is \(password)🫣")
            return
        }
    }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

