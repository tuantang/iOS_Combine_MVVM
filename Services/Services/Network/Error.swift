//
//  Error.swift
//  Services
//
//  Created by Tuan Tang on 14/11/2022.
//

import Foundation

public struct APIError: Error {
    public let code: Int
    public let message: String
    
    public static let unknowError = APIError(code: 0, message: "Unknow Error")
}
