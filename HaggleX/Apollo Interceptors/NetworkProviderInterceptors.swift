//
//  NetworkProviderInterceptors.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 23/10/2021.
//

import Foundation
import Apollo

class NetworkProviderInterceptors: DefaultInterceptorProvider {
    
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(TokenAddingInterceptor(), at: 0)
        return interceptors
    }
    
}
