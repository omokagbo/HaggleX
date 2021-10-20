//
//  CreateAccountViewController.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 20/10/2021.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    // MARK: - Outlets
    
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
    }
    
    // MARK: - Actions
    
    
    
    // MARK: - Methods
    
    private func setupNavbar() {
        navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.topItem?.title = " "
    }
    
}
