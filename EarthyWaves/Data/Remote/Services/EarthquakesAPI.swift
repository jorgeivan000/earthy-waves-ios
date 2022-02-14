//
//  EarthquakesAPI.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 10/02/22.
//

import Foundation

class EarthquakesAPI: EarthquakesAPIProtocol {
    func getEarthquakes(completion: @escaping (EarthquakesResponse?, String?) -> Void) {
         let sessionProvider = URLSessionProvider()
         sessionProvider.request(type: EarthquakesResponse.self, service: EarthquakeService.all) { response in // 2
             switch response {
             case let .success(earthquakesResponse):
                 debugPrint(earthquakesResponse.earthquakes ?? "Empty earthquakes")
                 completion(earthquakesResponse, nil)
             case let .failure(error):
                 debugPrint(error)
                 completion(nil, "Whoops! Something went wrong")
             }
         }
         
    }
    
    func getEarthquake(earthquakeId: Int, completion: @escaping (Earthquake?, String?) -> Void) {
        /*
         let sessionProvider = URLSessionProvider()
         sessionProvider.request(type: Earthquake.self, service: EarthquakeService.all) { response in // 2
             switch response { // 3
             case let .success(earthquake):
                 completion(earthquake, nil)
             case let .failure(error):
                 completion(nil, "error")
             }
         }
         */
    }
}
