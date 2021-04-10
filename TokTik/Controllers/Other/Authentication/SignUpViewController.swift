//
//  SignUpViewController.swift
//  TokTik
//
//  Created by James Estrada on 3/14/21.
//

import UIKit
import SafariServices

class SignUpViewController: UIViewController, UITextFieldDelegate {
    public var completion: (() -> Void)?
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let usernameField = AuthField(type: .username)
    private let emailField = AuthField(type: .email)
    private let passwordField = AuthField(type: .password)
    
    private let signUpButton = AuthButton(type: .signUp, title: nil)
    private let termsButton = AuthButton(type: .plain, title: "Terms of Services")
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Create Account"
        addSubviews()
        configureFields()
        configureButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        usernameField.becomeFirstResponder()
    }
    
    func configureFields() {
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.width, height: 50))
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil), // push done button all the way to the right
            UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapKeyboardDone))
        ]
        toolBar.sizeToFit()
        usernameField.inputAccessoryView = toolBar
        emailField.inputAccessoryView = toolBar
        passwordField.inputAccessoryView = toolBar
    }
    
    @objc func didTapKeyboardDone() {
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    func addSubviews() {
        view.addSubview(logoImageView)
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signUpButton)
        view.addSubview(termsButton)
    }
    
    func configureButtons() {
        signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTerms), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let imageSize: CGFloat = 100
        logoImageView.frame = CGRect(x: (view.width - imageSize) / 2, y: view.safeAreaInsets.top + 5, width: imageSize, height: imageSize)
        usernameField.frame = CGRect(x: 20, y: logoImageView.bottom + 20, width: view.width - 40, height: 55)
        emailField.frame = CGRect(x: 20, y: usernameField.bottom + 15, width: view.width - 40, height: 55)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom + 15, width: view.width - 40, height: 55)
        
        signUpButton.frame = CGRect(x: 20, y: passwordField.bottom + 20, width: view.width - 40, height: 55)
        termsButton.frame = CGRect(x: 20, y: signUpButton.bottom + 40, width: view.width - 40, height: 55)
    }
    
    // Actions
    
    @objc func didTapSignUp() {
        didTapKeyboardDone()
        guard let username = usernameField.text,
              let email = emailField.text,
              let password = passwordField.text,
              !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6,
              !username.contains(" "),
              !username.contains(".") else {
            
            let alert = UIAlertController(
                title: "Woops",
                message: "Please make sure to enter a valid username, email, and password. Your password must be at least 6 characters long",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            
            return
        }
        
        AuthManager.shared.signUp(with: username, emailAddress: email, password: password) { success in
            
        }
    }
    
    @objc func didTapTerms() {
        didTapKeyboardDone()
        guard let url = URL(string: "https://www.tiktok.com/legal/terms-of-service?lang=en") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }

}
