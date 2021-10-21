//
//  SetupCompleteViewController.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 21/10/2021.
//

import UIKit

class SetupCompleteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction func didTapExplore(_ sender: UIButton) {
        self.presentDashboard()
    }
    
    
}
