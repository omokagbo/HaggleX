//
//  CreateAccountViewController.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 20/10/2021.
//

import UIKit
import FlagPhoneNumber
import KeychainSwift
import Apollo

class CreateAccountViewController: UIViewController {
    
    // MARK: - Properties
    
    var formattedPhoneNumber = ""
    
    var listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)
    
    static let registerKeyChain = "register"
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: FPNTextField!
    
    @IBOutlet weak var referralCodeTextField: UITextField!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        phoneNumberTextField.delegate = self
        setupPhoneNumberTextField()
    }
    
    // MARK: - Actions
    
    @IBAction func didTapSignup(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let username = usernameTextField.text else { return }
        guard let phoneNumber = phoneNumberTextField.text else { return }
        guard let referalCode = referralCodeTextField.text else { return }
        
        Network.shared.apollo.perform(mutation: RegisterMutation(data: CreateUserInput(email: email, username: username, password: password, phonenumber: phoneNumber, referralCode: referalCode, phoneNumberDetails: nil, country: "Nigeria", currency: "Naira"))) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                self.showDefaultAlert(title: "Network Error", message: error.localizedDescription)
                
            case .success(let graphQLResult):
                
                if let token = graphQLResult.data?.register?.token {
                    let keychain = KeychainSwift()
                    keychain.set(token, forKey: CreateAccountViewController.registerKeyChain)
                    self.presentVerifyAccountScreen(userEmail: email)
                }
                
                if let errors = graphQLResult.errors {
                    let message = errors.map({ $0.localizedDescription }).joined(separator: "\n")
                    self.showDefaultAlert(title: "GraphQL Error(s)", message: message)
                }
                
            }
            
        }
    }
    
    // MARK: - Methods
    
    private func setupPhoneNumberTextField() {
        phoneNumberTextField.displayMode = .list
        
        listController.setup(repository: phoneNumberTextField.countryRepository)
        
        listController.didSelect = { [weak self] country in
            self?.phoneNumberTextField.setFlag(countryCode: country.code)
        }
    }
    
}

// MARK: - Extensions

extension CreateAccountViewController: FPNTextFieldDelegate {
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code)
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        if isValid {
            self.formattedPhoneNumber = "\(textField.getFormattedPhoneNumber(format: .E164) ?? "2348000000000")"
        }
    }
    
    func fpnDisplayCountryList() {
        let navigationController = UINavigationController(rootViewController: listController)
        
        listController.title = "Countries"
        
        self.present(navigationController, animated: true)
    }
    
    
}
