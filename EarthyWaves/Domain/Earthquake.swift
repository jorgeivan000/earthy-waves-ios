//
//  Earthquake.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 10/02/22.
//

import Foundation

class Earthquake: Codable {
    
    var id: String?
    var date: Date?
    var latitude: Double?
    var longitude: Double?
    var depth: Double?
    var magnitude: Double?
    var source: String?
    lazy var isMagnitudeCritical: Bool = {
        return magnitude ?? 0.0 >= 8.0
    }()

    private enum CodingKeys: String, CodingKey {
        case id = "eqid"
        case date = "datetime"
        case latitude = "lat"
        case longitude = "lng"
        case depth
        case magnitude
        case source = "src"
    }
    
    convenience init(id: String?, date: Date?, latitude: Double?, longitude: Double?, depth: Double?, magnitude: Double?, source: String?) {
        self.init()
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.depth = depth
        self.magnitude = magnitude
        self.source = source
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        if let currentDate = try container.decodeIfPresent(String.self, forKey: .date) {
            self.date = DateHelper.date(from: currentDate)
        }
        self.latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
        self.longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)
        self.depth = try container.decodeIfPresent(Double.self, forKey: .depth)
        self.magnitude = try container.decodeIfPresent(Double.self, forKey: .magnitude)
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
    }
    
    func encode(to encoder: Encoder) throws {}
}
