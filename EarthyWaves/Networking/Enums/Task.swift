//
//  Task.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 11/02/22.
//

typealias Parameters = [String: Any]

enum Task {
    case requestPlain
    case requestParameters(Parameters)
}
