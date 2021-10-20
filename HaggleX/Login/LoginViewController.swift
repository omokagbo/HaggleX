//
//  LoginViewController.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 20/10/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func didTapForgotPassword(_ sender: UIButton) {
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
    }
    
    @IBAction func didTapCreateAccount(_ sender: UIButton) {
        guard let createAccountVC = UIStoryboard(name: "CreateAccount", bundle: nil).instantiateViewController(withIdentifier: "CreateAccountViewController") as? CreateAccountViewController else {
            return
        }
        navigationController?.pushViewController(createAccountVC, animated: true)
    }
    
    
}
