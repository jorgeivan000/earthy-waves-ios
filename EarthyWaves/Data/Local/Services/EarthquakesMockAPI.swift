//
//  EarthquakesMockAPI.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 13/02/22.
//

import Foundation

class EarthquakesAPI: EarthquakesAPIProtocol {
    func getEarthquakes(completion: @escaping (EarthquakesResponse?, String?) -> Void) {
        let earthquakes = [
            Earthquake(id: "001",
                       date: Date(),
                       latitude: -22,
                       longitude: 23,
                       depth: 4.4,
                       magnitude: 6.9,
                       source: "us"),
            Earthquake(id: "002",
                       date: Date(),
                       latitude: 34,
                       longitude: -10,
                       depth: 3.5,
                       magnitude: 8.0,
                       source: "us"),
            Earthquake(id: "003",
                       date: Date(),
                       latitude: -34.4,
                       longitude: 12.3,
                       depth: 3.4,
                       magnitude: 6.5,
                       source: "us")
                                    
        ]
        completion(EarthquakesResponse(earthquakes: earthquakes), nil)
    }
    
    func getEarthquake(earthquakeId: Int, completion: @escaping (Earthquake?, String?) -> Void) {
        /*
         let sessionProvider = URLSessionProvider()
         sessionProvider.request(type: Movie.self, service: MovieService.latest) { response in // 2
             switch response { // 3
             case let .success(movie):
                 completion(movie, nil)
             case let .failure(error):
                 completion(nil, "error")
             }
         }
         */
    }
}
