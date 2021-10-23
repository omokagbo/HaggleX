//
//  DashboardViewController.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 21/10/2021.
//

import UIKit
import KeychainSwift

class DashboardViewController: UIViewController {
    
    // MARK: - Properties
    
    private let coinViewModel: CoinViewModel = CoinViewModel()
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var coinsTableView: UITableView!
    
    @IBOutlet weak var secondCoinsTableView: UITableView!
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var cardView2: UIView!
    
    @IBOutlet weak var cardView3: UIView!
    
    @IBOutlet weak var cardView4: UIView!
    
    @IBOutlet weak var cryptoNewsTableView: UITableView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCardViews()
    }
    
    // MARK: - Actions
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            balanceLabel.text = "$****"
        } else {
            balanceLabel.text = "₦****"
        }
    }
    
    @IBAction func didTapViewAllStories(_ sender: UIButton) {
        print("View all stories")
        self.showDefaultAlert(title: "Ooops", message: "Functionality coming soon")
    }
    
    // MARK: - Methods
    
    private func createCardView(viewName: UIView) {
        viewName.backgroundColor = .white
        viewName.layer.cornerRadius = 10.0
        viewName.layer.shadowColor = UIColor.systemGray3.cgColor
        viewName.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        viewName.layer.shadowRadius = 6.0
        viewName.layer.shadowOpacity = 0.7
    }
    
    private func setupCardViews() {
        createCardView(viewName: cardView)
        createCardView(viewName: cardView2)
        createCardView(viewName: cardView3)
        createCardView(viewName: cardView4)
    }
    
    @IBAction func didTapLogout() {
        let loginViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true)
    }
    
}

// MARK: - CollectionView Extensions

extension DashboardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}

extension DashboardViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 40), height: 100)
    }
}

// MARK: - Table View Extensions

extension DashboardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == coinsTableView {
            return coinViewModel.coins.count
        } else if tableView == cryptoNewsTableView {
            return 5
        } else {
            return coinViewModel.twoCoins.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == coinsTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinsTableViewCell", for: indexPath) as? CoinsTableViewCell else {
                return UITableViewCell()
            }
            cell.setup(with: coinViewModel.coins[indexPath.row])
            return cell
        } else  if tableView == cryptoNewsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinsTableViewCell", for: indexPath) as? CoinsTableViewCell else {
                return UITableViewCell()
            }
            cell.setup(with: coinViewModel.twoCoins[indexPath.row])
            return cell
        }
    }
}

extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}


