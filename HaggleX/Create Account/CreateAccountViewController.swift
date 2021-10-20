//
//  CreateAccountViewController.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 20/10/2021.
//

import UIKit
import FlagPhoneNumber

class CreateAccountViewController: UIViewController {
    
    // MARK: - Properties
    
    var formattedPhoneNumber = ""
    
    var listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)
    
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
    }
    
    // MARK: - Methods
    
    private func setupNavbar() {
        navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.topItem?.title = " "
    }
    
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
