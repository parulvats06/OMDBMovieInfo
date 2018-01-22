//
//  Settings.swift
//  MovieInfo
//
//  Created by parul vats on 22/01/2018.
//  Copyright © 2018 parul vats. All rights reserved.
//

import UIKit

class Settings {
    
    /// Singleton instance
    static let sharedInstance: Settings = Settings()
    
    fileprivate func readPlist(key: String, bundle: String) -> AnyObject? {
        if let path = Bundle.main.path(forResource: bundle, ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            if let value = dict[key] {
                return value
            }
        }
        return nil
    }
    
    func getAPIKey() -> String? {
        if let apiKey = readPlist(key: Keys.apiKey, bundle: "Configuration") as? String {
            return apiKey
        }
        return nil
    }
}
