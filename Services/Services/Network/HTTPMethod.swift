//
//  HTTPMethod.swift
//  Services
//
//  Created by Tuan Tang on 08/11/2022.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case head = "HEAD"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case connect = "CONNECT"
    case options = "OPTIONS"
    case trace = "TRACE"
    case patch = "PATCH"
}
