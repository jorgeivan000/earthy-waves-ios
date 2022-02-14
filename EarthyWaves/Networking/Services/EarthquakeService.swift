//
//  EarthquakeService.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 11/02/22.
//

import Foundation

enum EarthquakeService: ServiceProtocol {
    
    case all
    
    var baseURL: URL {
        return URL(string: APIConstants.apiBaseURL)!
    }
    
    var path: String {
        switch self {
        case .all:
            return Endpoints.Earthquakes.all.endpoint
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        switch self {
            /*
        case .all:
            return .requestPlain
             */
        case .all:
            let parameters: [String: Any] = [
                "formatted": true,
                "north": 44.1,
                "south": 9.9,
                "east": 22.4,
                "west":55.2,
                "username": "mkoppelman"
            ]
            return .requestParameters(parameters)
        }
    }
    
    var headers: Headers? {
        return nil
    }
    
    var parametersEncoding: ParametersEncoding {
        return .url
    }
}
