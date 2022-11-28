//
//  NetworkServiceType.swift
//  Services
//
//  Created by Tuan Tang on 08/11/2022.
//

import Combine

public protocol NetworkServiceType {
    @discardableResult
    func request<T>(_ resource: Resource<T>) -> AnyPublisher<T, Error>
}

enum NetworkError: Error {
    case invalidRequest
    case invalidResponse
    case dataLoadingError(statusCode: Int, data: Data)
    case jsonDecodingError(error: Error)
}
