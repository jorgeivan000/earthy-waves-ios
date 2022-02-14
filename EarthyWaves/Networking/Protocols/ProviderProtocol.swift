//
//  ProviderProtocol.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 11/02/22.
//

import Foundation

protocol ProviderProtocol {
    func request<T>(type: T.Type, service: ServiceProtocol, completion: @escaping (NetworkResponse<T>) -> ()) where T: Decodable
}
