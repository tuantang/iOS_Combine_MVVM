//
//  Publisher+Extension.swift
//  Services
//
//  Created by Tuan Tang on 08/11/2022.
//

import Combine

extension Publisher {
    public static func empty() -> AnyPublisher<Output, Failure> {
        return Empty().eraseToAnyPublisher()
    }
    
    public static func just(_ output: Output) -> AnyPublisher<Output, Failure> {
        return Just(output)
            .catch { _ in AnyPublisher<Output, Failure>.empty() }
            .eraseToAnyPublisher()
    }
    
    public static func fail(_ error: Failure) -> AnyPublisher<Output, Failure> {
        return Fail(error: error).eraseToAnyPublisher()
    }
}

