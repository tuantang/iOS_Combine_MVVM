//
//  Resource.swift
//  Services
//
//  Created by Tuan Tang on 08/11/2022.
//

import Foundation
import Keys

public struct Resource<T: Decodable> {
    let url: URL
    let method: HTTPMethod
    let headers: [String: CustomStringConvertible]
    let parameters: [String: CustomStringConvertible]
    var request: URLRequest? {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        components.queryItems = parameters.keys.map { key in
            URLQueryItem(name: key, value: parameters[key]?.description)
        }
        
        guard let url = components.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        for (key, value) in headers {
            request.setValue(value as? String, forHTTPHeaderField: key)
        }
        return request
    }
    
    public init(url: URL,
         method: HTTPMethod = .get,
         headers: [String : CustomStringConvertible] = [:],
         parameters: [String : CustomStringConvertible] = [:]) {
        self.url = url
        self.method = method
        self.headers = headers
        self.parameters = parameters
    }
}
