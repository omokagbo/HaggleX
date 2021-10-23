//
//  Network.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 22/10/2021.
//

import Foundation
import Apollo
import KeychainSwift

class Network {
    
    static let shared = Network()
    
    private init() {}
    
    //    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://api-staging.hagglex.com/graphql")!)
    
    private(set) lazy var apollo: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = NetworkProviderInterceptors(client: client, store: store)
        let url = URL(string: "https://api-staging.hagglex.com/graphql")!
        let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        return ApolloClient(networkTransport: transport, store: store)
    }()
    
}
