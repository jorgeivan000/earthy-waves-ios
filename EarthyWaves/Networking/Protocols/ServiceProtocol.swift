//
//  ServiceProtocol.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 11/02/22.
//

import Foundation

typealias Headers = [String: String]

protocol ServiceProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: Headers? { get }
    var parametersEncoding: ParametersEncoding { get }
}
