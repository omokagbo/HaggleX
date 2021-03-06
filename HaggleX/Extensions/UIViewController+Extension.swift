//
//  UIViewController+Extension.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 20/10/2021.
//

import UIKit
import Apollo

extension UIViewController {
    
    public func setupNavbar() {
        navigationController?.navigationBar.tintColor = .white
        
        self.navigationController?.navigationBar.topItem?.title = " "
    }
    
    public func showDefaultAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func showAlertForErrors(_ errors: [GraphQLError]) {
        let message = errors
          .map { $0.localizedDescription }
          .joined(separator: "\n")
        self.showDefaultAlert(title: "GraphQL Error(s)", message: message)
      }
    
    public func presentCreateAccountScreen() {
        guard let createAccountVC = UIStoryboard(name: "CreateAccount", bundle: nil).instantiateViewController(withIdentifier: "CreateAccountViewController") as? CreateAccountViewController else {
            return
        }
        
        navigationController?.pushViewController(createAccountVC, animated: true)
    }
    
    public func presentVerifyAccountScreen(userEmail: String) {
        guard let verifyAccountVC = UIStoryboard(name: "VerifyAccount", bundle: nil).instantiateViewController(withIdentifier: "VerifyAccountViewController") as? VerifyAccountViewController else {
            return
        }
        
        verifyAccountVC.userEmail = userEmail
        
        navigationController?.pushViewController(verifyAccountVC, animated: true)
    }
    
    public func presentSetupCompleteScreen() {
        guard let setupCompleteVC = UIStoryboard(name: "SetupComplete", bundle: nil).instantiateViewController(withIdentifier: "SetupCompleteViewController") as? SetupCompleteViewController else {
            return
        }
        
        setupCompleteVC.modalPresentationStyle = .fullScreen
        
        navigationController?.pushViewController(setupCompleteVC, animated: true)
    }
    
    public func presentDashboard() {
        guard let dashboardViewController = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController else {
            return
        }
        
        dashboardViewController.modalPresentationStyle = .fullScreen
        
        dashboardViewController.modalTransitionStyle = .flipHorizontal
        
        self.navigationController?.present(dashboardViewController, animated: true)
    }
    
}
