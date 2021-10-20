//
//  CreateAccountViewController.swift
//  HaggleX
//
//  Created by Decagon on 20/10/2021.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
    }
    
    
    // MARK: - Methods
    
    private func setupNavbar() {
        navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.topItem?.title = " "
    }
    
}
