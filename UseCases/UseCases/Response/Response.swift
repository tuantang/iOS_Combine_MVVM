//
//  Response.swift
//  UseCases
//
//  Created by Tuan Tang on 10/11/2022.
//

import Foundation

public struct Response<T: Decodable>: Decodable {
    public let get: String
    public let errors: [String]
    public let results: Int
    public let paging: Paging
    public let response: T?
    
    enum CodingKeys: String, CodingKey {
        case get, errors, results, paging, response
    }
}

public struct Paging: Decodable {
    let current: Int
    let total: Int
    
    enum CodingKeys: String, CodingKey {
        case current, total
    }
}
