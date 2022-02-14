//
//  NetworkResponse.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 11/02/22.
//

enum NetworkResponse<T> {
    case success(T)
    case failure(NetworkError)
}
