//
//  LoginViewController.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 20/10/2021.
//

import UIKit
import KeychainSwift

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Properties
    
    static let loginKeychainKey = "login"
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func didTapForgotPassword(_ sender: UIButton) {
        self.showDefaultAlert(title: "Oooops", message: "This functionality is coming soon")
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
//        validateLogin()
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Network.shared.apollo.perform(mutation: LoginMutation(data: LoginInput(input: email, password: password))) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                self.showDefaultAlert(title: "Network Error", message: error.localizedDescription)
            case .success(let graphQLResult):
                if let token = graphQLResult.data?.login.token {
                    let keychain = KeychainSwift()
                    keychain.set(token, forKey: LoginViewController.loginKeychainKey)
                    self.presentDashboard()
                }
                
                if let errors = graphQLResult.errors {
                    let message = errors.map({ $0.localizedDescription }).joined(separator: "\n")
                    self.showDefaultAlert(title: "GraphQL Error(s)", message: message)
                }
            }
        }
    }
    
    @IBAction func didTapCreateAccount(_ sender: UIButton) {
        self.presentCreateAccountScreen()
    }
    
    private func validateLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        if email.isEmpty || email == "".replacingOccurrences(of: " ", with: "") {
            self.showDefaultAlert(title: "Invalid email", message: "Please enter a valid email")
        }
        
        if password.isEmpty || password == "".replacingOccurrences(of: " ", with: "") {
            self.showDefaultAlert(title: "Invalid password", message: "Please enter a valid password")
        }
    }
    
}
