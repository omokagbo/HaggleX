//
//  VerifyAccountViewController.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 21/10/2021.
//

import UIKit
import KeychainSwift

class VerifyAccountViewController: UIViewController {
    
    // MARK: - Properties
    static let verifyUserKeychainKey = "verifyUser"
    
    public var userEmail = ""
    
    // MARK: - Outlets
    
    @IBOutlet weak var verificationCodeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        print(userEmail)
    }
    
    // MARK: - Actions
    
    @IBAction func didTapVerifyMe(_ sender: UIButton) {
        guard let code = verificationCodeTextField.text else { return }
        guard let verificationCode = Int(code) else { return }
        Network.shared.apollo.perform(mutation: VerifyUserMutation(data: VerifyUserInput(code: verificationCode))) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                self.showDefaultAlert(title: "Network Error", message: error.localizedDescription)
                
            case .success(let graphQLResult):
                if let token = graphQLResult.data?.verifyUser?.token {
                    let keychain = KeychainSwift()
                    keychain.set(token, forKey: VerifyAccountViewController.verifyUserKeychainKey)
                    self.presentSetupCompleteScreen()
                }
                
                if let errors = graphQLResult.errors {
                    let message = errors.map({ $0.localizedDescription }).joined(separator: "\n")
                    self.showDefaultAlert(title: "GraphQL Error(s)", message: message)
                }
            }
        }
    }
    
    @IBAction func didTapResendCode(_ sender: UIButton) {
        Network.shared.apollo.fetch(query: ResendVerificationCodeQuery(data: EmailInput(email: userEmail))) { [weak self] result in
            
            switch result {
            case .failure(let error):
                self?.showDefaultAlert(title: "Network Error", message: error.localizedDescription)
                
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    let message = errors.map({ $0.localizedDescription }).joined(separator: "\n")
                    self?.showDefaultAlert(title: "GraphQL Error(s)", message: message)
                }
            }
        }
    }

}
