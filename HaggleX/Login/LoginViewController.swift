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
        self.showDefaultAlert(title: "Oooops", message: "This functionality is coming soon")
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        // validate login
        
        // present dashboard
        self.presentDashboard()
    }
    
    @IBAction func didTapCreateAccount(_ sender: UIButton) {
        self.presentCreateAccountScreen()
    }
    
    private func validateLogin() {
        
    }
    
}
