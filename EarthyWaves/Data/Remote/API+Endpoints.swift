//
//  API+Endpoints.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 10/02/22.
//

import Foundation

protocol RemoteResource {
    var endpoint: String { get }
    var url: String { get }
}

enum Endpoints {
    enum Earthquakes: RemoteResource {
        case current
        case all

        var endpoint: String {
            switch self {
            case .current:
                return url
            case .all:
                return "\(url)/earthquakesJSON"
            }
        }

        var url: String {
            switch self {
            case .current, .all:
                return APIConstants.apiBaseURL
            }
        }
    }
}
