//
//  CoinsTableViewCell.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 21/10/2021.
//

import UIKit


class CoinsTableViewCell: UITableViewCell {
   
    // MARK: - Outlets
    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var coinName: UILabel!
    
    @IBOutlet weak var coinPrice: UILabel!
    
    @IBOutlet weak var coinGrowthPercent: UILabel!
    
    @IBOutlet weak var coinGrowthGraph: UIImageView!
    
    // MARK: - Methods
    
    public func setup(with model: CoinModel) {
        logoImage.image = UIImage(named: model.coinLogo)
        coinName.text = model.coinName
        coinPrice.text = model.coinPrice
        coinGrowthPercent.text = model.coinGrowthRate
        coinGrowthGraph.image = UIImage(named: model.coinGrowthGraph)
    }
}
