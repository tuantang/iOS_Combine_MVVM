//
//  NetworkServiceConstant.swift
//  Services
//
//  Created by Tuan Tang on 09/11/2022.
//

import Foundation

public class NetworkServiceConstant {
    public static var shared: NetworkServiceConstant = NetworkServiceConstant()
    private init() {}
    
    /// Get Base URL from Info.plist
    public var apiURL: URL {
        guard let apiURL = Bundle.main.object(forInfoDictionaryKey: "ApiURL") as? String else {
            fatalError("ApiURL must not be empty in plist")
        }
        return URL(string: apiURL)!
    }
}
