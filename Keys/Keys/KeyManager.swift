//
//  KeyManager.swift
//  Keys
//
//  Created by Tuan Tang on 09/11/2022.
//

import Foundation

public class KeyManager {
    fileprivate static var instance: KeyManager!
    private var dictionary: NSDictionary?
    public static var shared : KeyManager {
        self.instance = (self.instance ?? KeyManager())
        return self.instance
    }
    
    init() {
        if let path = Bundle(identifier: "com.tuantang.SoccerFan.Keys")?.path(forResource: "Key", ofType: "plist") {
            dictionary = NSDictionary(contentsOfFile: path)
        }
    }
    
    public var XRapidAPIKey: String {
        let key = dictionary?.value(forKey: "XRapidAPIKey")
        return (key as? String) ?? ""
    }
    
    public var XRapidAPIHost: String {
        let key = dictionary?.value(forKey: "XRapidAPIHost")
        return (key as? String) ?? ""
    }
}
