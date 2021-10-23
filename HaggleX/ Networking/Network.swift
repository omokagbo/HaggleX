//
//  Network.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 22/10/2021.
//

import Foundation
import Apollo

class Network {
    
    static let shared = Network()
    
    private init() {}
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://api-staging.hagglex.com/graphql")!)
    
}
