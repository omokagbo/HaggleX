//
//  TokenAddingInterceptor.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 23/10/2021.
//

import Foundation
import Apollo
import KeychainSwift


class TokenAddingInterceptor: ApolloInterceptor {
    
    func interceptAsync<Operation: GraphQLOperation>(
            chain: RequestChain,
            request: HTTPRequest<Operation>,
            response: HTTPResponse<Operation>?,
            completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
                let keychain = KeychainSwift()
                
                if let token = keychain.get(CreateAccountViewController.registerKeyChain) {
                    request.addHeader(name: "Authorization", value: "Bearer \(token)")
                }
                
                chain.proceedAsync(request: request, response: response, completion: completion)
        }
    
}
