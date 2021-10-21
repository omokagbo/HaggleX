//
//  VerifyAccountViewController.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 21/10/2021.
//

import UIKit

class VerifyAccountViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var verificationCodeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
    }
    
    // MARK: - Actions
    
    @IBAction func didTapVerifyMe(_ sender: UIButton) {
        // verify if email is correct
        
        // present setup complete screen
        self.presentSetupCompleteScreen()
    }
    
    @IBAction func didTapResendCode(_ sender: UIButton) {
        self.showDefaultAlert(title: "Ooops", message: "Functionality coming soon")
    }
    
    // MARK: - Methods
    
    private func verifyEmail() {
        
    }

}
