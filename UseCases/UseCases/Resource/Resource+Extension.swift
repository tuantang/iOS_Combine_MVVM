//
//  Resource+Extension.swift
//  UseCases
//
//  Created by Tuan Tang on 09/11/2022.
//

import Services
import Keys

extension Resource {
    static var headers: [String: CustomStringConvertible] {
        return [
            "X-RapidAPI-Key": KeyManager.shared.XRapidAPIKey,
            "X-RapidAPI-Host": KeyManager.shared.XRapidAPIHost
        ]
    }
}
