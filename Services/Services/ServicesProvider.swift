//
//  ServicesProvider.swift
//  Services
//
//  Created by Tuan Tang on 08/11/2022.
//

import Foundation

public class ServicesProvider {
    public let network: NetworkServiceType
    
    public static func defaultProvider() -> ServicesProvider {
        let network = NetworkService()
        return ServicesProvider(network: network)
    }
    
    init(network: NetworkServiceType) {
        self.network = network
    }
}
