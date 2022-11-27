//
//  ViewController.swift
//  Ex7
//
//  Created by Alice’z Poy on 2022-11-02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    //SignIn
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //SignUp
    @IBOutlet weak var signUpView: UIStackView!
    @IBOutlet weak var usernameSignUpTextField: UITextField!
    @IBOutlet weak var passwordSignUpTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var modifyButton: UIButton!
    
    var userObj: [User] = []

    @IBAction func saveAction(_ sender: Any) {
//        showDetailView()
//        showSignInView()
        addUser()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
    }
    
    @IBAction func loginAction(_ sender: Any) {
        showDetailView()
    }
    
    @IBAction func registerAction(_ sender: Any) {
        showSignUpView()
    }
    
    @IBAction func modifyAction(_ sender: Any) {
        showModifyView()
    }
    
    func showSignInView() {
        signInView.isHidden = false
        signUpView.isHidden = true
        textView.isHidden = true
        saveButton.isHidden = true
        cancelButton.isHidden = true
        modifyButton.isHidden = true
    }
    
    func showSignUpView() {
        signInView.isHidden = true
        signUpView.isHidden = false
        textView.isHidden = true
        saveButton.isHidden = false
        cancelButton.isHidden = false
        modifyButton.isHidden = true
    }
    
    func showDetailView() {
        signInView.isHidden = true
        signUpView.isHidden = true
        textView.isHidden = false
        saveButton.isHidden = true
        cancelButton.isHidden = true
        modifyButton.isHidden = false
    }
    
    func showModifyView() {
        showSignUpView()
    }
    
    func addUser() {
        if let username = usernameSignUpTextField.text, !username.isEmpty,
            let password = passwordSignUpTextField.text, !password.isEmpty,
            let firstname = firstNameTextField.text, !firstname.isEmpty,
            let lastname = lastNameTextField.text, !lastname.isEmpty,
            let email = emailTextField.text, !email.isEmpty {
            if !userObj.contains(where: { $0.username == username }) {
                let user = User(username: username, password: password, firstName: firstname, lastName: lastname, email: email)
                userObj.append(user)
            } else {
                showAlert(message: "This username has been taken")
            }
        } else if (usernameSignUpTextField.text == nil) && !(usernameSignUpTextField.text?.isEmpty ?? true) {
            showAlert(message: "Please provide your username")
        } else if (passwordSignUpTextField.text == nil) {
            showAlert(message: "Please provide your password")
        } else if (firstNameTextField.text == nil) {
            showAlert(message: "Please provide your firstname")
        } else if (lastNameTextField.text == nil) {
            showAlert(message: "Please provide your lastname")
        } else if (emailTextField.text == nil) {
            showAlert(message: "Please provide your email")
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        present(alert, animated: false)
    }
}
