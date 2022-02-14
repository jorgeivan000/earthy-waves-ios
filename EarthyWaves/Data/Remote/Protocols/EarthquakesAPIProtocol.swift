//
//  EarthquakesAPIProtocol.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 10/02/22.
//

import Foundation
import UIKit

protocol EarthquakesAPIProtocol: DataProvider {
    //func getEarthquake(earthquakeId: Int, completion: @escaping (Earthquake?, String?) -> Void)
    func getEarthquakes(completion: @escaping (EarthquakesResponse?, String?) -> Void)
}
