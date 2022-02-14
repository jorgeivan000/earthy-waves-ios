//
//  InfoPlistHelper.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 10/02/22.
//

import Foundation

enum InfoPlistKey: String {
    case appName = "ConfigName"
    case api = "CoreAPIURL"
    case apiVersion = "CoreAPIVersion"
    case customAPIKey = "CustomAPIKey"
}

class InfoPlistHelper {
    class func lookUpFor(_ key: InfoPlistKey) -> Any? {
        guard let infoPlist = Bundle.main.infoDictionary, let value = infoPlist[key.rawValue] else {
            debugPrint("There is no info plist value")
            return nil
        }
        debugPrint("Looking for \(value) for key \(key)")
        return value
    }
}
