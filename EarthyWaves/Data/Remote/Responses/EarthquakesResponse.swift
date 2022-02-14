//
//  EarthquakesResponse.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 10/02/22.
//

import Foundation
class EarthquakesResponse: Decodable {
    
    var earthquakes: [Earthquake]?
    
    private enum CodingKeys: CodingKey {
        case earthquakes
    }
    
    init(earthquakes: [Earthquake]) {
        self.earthquakes = earthquakes
    }
    
    required init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.earthquakes = [Earthquake]()
        if let currentEarthquakes = try container.decodeIfPresent([Earthquake].self, forKey: .earthquakes) {
            self.earthquakes = currentEarthquakes
        }
    }
}
