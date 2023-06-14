//
//  LoginViewController.swift
//  BackToIos
//
//  Created by Ömer Faruk KÖSE on 11.06.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private var logoImage: UIImageView {
        // Create UIImageView
        let imageView = UIImageView(frame: CGRect(
            x: view.width/4,
            y: view.safeAreaInsets.top + 100,
            width: view.width/2,
            height: view.width/2))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 40
        imageView.layer.masksToBounds = true
        
        // Set image
        let image = UIImage(named: "logo")
        imageView.image = image
        
        return imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self,
                              action: #selector(didTapLoginButton),
                              for: .touchUpInside)
        
        createAccountButton.addTarget(self,
                              action: #selector(didTapCreateAccountButton),
                              for: .touchUpInside)
        
        termsButton.addTarget(self,
                              action: #selector(didTapTermsButton),
                              for: .touchUpInside)
        
        termsButton.addTarget(self,
                              action: #selector(didTapPrivacyButton),
                              for: .touchUpInside)
        
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        
        
        assignbackground()
        addSubView()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assign frames
        logoImage.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top,
            width: view.frame.width / 2,
            height: view.frame.height - view.safeAreaInsets.top - 20)

        usernameEmailField.frame = CGRect(
            x: 25,
            y:  logoImage.bottom + 10,
            width: view.width-50,
            height: 52)
        
        passwordField.frame = CGRect(
            x: 25,
            y:  usernameEmailField.bottom + 10,
            width: view.width-50,
            height: 52)

        loginButton.frame = CGRect(
            x: 25,
            y:  passwordField.bottom + 10,
            width: view.width-50,
            height: 52)
        
        createAccountButton .frame = CGRect(
            x: 25,
            y:  loginButton.bottom + 10,
            width: view.width-50,
            height: 52)
        
        termsButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom-100,
            width: view.width-20,
            height: 50)
        
        privacyButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom-50,
            width: view.width-20,
            height: 50)
        
        
    }
    
    private func assignbackground(){
      let background = UIImage(named: "background")

      var imageView : UIImageView!
      imageView = UIImageView(frame: view.bounds)
      imageView.contentMode = .scaleAspectFill
      imageView.clipsToBounds = true
      imageView.image = background
      imageView.center = view.center
      view.addSubview(imageView)
      view.sendSubviewToBack(imageView)
    }
    
    private func addSubView() {
        view.addSubview(logoImage)
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
    }
    
    @objc private func didTapLoginButton() {}
    
    @objc private func didTapCreateAccountButton() {}
    
    @objc private func didTapTermsButton() {}
    
    @objc private func didTapPrivacyButton() {}
    
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder()
        } else if textField == usernameEmailField {
            didTapLoginButton()
        }
        
        return true
    }
}
