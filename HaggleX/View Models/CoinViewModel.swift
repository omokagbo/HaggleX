//
//  CoinViewModel.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 21/10/2021.
//

import UIKit

class CoinViewModel {
    
    let coins = [
        CoinModel(coinLogo: "haggle1", coinName: "Haggle (HAG)", coinPrice: "N380", coinGrowthRate: "", coinGrowthGraph: "haggle2"), CoinModel(coinLogo: "bitcoin1", coinName: "Bitcoin (BTC)", coinPrice: "N4,272,147.00", coinGrowthRate: "+2.34%", coinGrowthGraph: "bitcoin2"), CoinModel(coinLogo: "ethereum1", coinName: "Ethereum (ETH)", coinPrice: "N4,272,147.00", coinGrowthRate: "+2.34%", coinGrowthGraph: "ethereum2"), CoinModel(coinLogo: "tether1", coinName: "Tether (USDT)", coinPrice: "N4,272,147.00", coinGrowthRate: "+2.34%", coinGrowthGraph: "tether2"), CoinModel(coinLogo: "bitcoincash1", coinName: "Bitcoin Cash (BCH)", coinPrice: "N4,272,147.00", coinGrowthRate: "+2.34%", coinGrowthGraph: "bitcoincash2")
    ]
    
    let twoCoins = [CoinModel(coinLogo: "dogecoin1", coinName: "Dogecoin (DOGE)", coinPrice: "N4,272,147.00", coinGrowthRate: "+2.34%", coinGrowthGraph: "dogecoin2"), CoinModel(coinLogo: "litecoin1", coinName: "Litecoin (LTC)", coinPrice: "N4,272,147.00", coinGrowthRate: "+2.34%", coinGrowthGraph: "litecoin2")]
    
}
