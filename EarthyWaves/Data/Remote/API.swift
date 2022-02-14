//
//  API.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 10/02/22.
//

import Foundation

struct APIConstants {
    static let apiVersion = "/api/\(InfoPlistHelper.lookUpFor(.apiVersion) ?? "")"
    static let apiBaseURL = "\(InfoPlistHelper.lookUpFor(.api) ?? "")"
    static let appBaseURL = "\(InfoPlistHelper.lookUpFor(.api) ?? "")/app"
}

struct AppHeaders {
    static let authKey = "Authorization"
    static let contentType = "Content-Type"
}
