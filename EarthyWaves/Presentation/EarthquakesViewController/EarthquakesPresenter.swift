//
//  EarthquakePresenter.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 10/02/22.
//

import Foundation

class EarthquakesPresenter: EarthquakesViewPresenter {
    // MARK: - Delegate
    weak fileprivate var view: EarthquakesView?
    
    // MARK: - Services
    let earthquakeService: EarthquakesAPIProtocol
    
    required init(view: EarthquakesView, earthquakeService: EarthquakesAPIProtocol) {
        self.view = view
        self.earthquakeService = earthquakeService
    }
    
    func getEarthquakes() {
        earthquakeService.getEarthquakes { earthquakesResponse, error in
            guard error == nil else {
                self.view?.showAlert(title: "EarthyWaves Error", message: "Whoops!, try again later", action: "OK")
                return
            }
            if let earthquakes = earthquakesResponse?.earthquakes {
                self.view?.updateEarthquakesList(earthquakes: earthquakes)
            } else {
                self.view?.showAlert(title: "EarthyWaves Error", message: "There are no earthquakes available", action: "OK")
            }
        }
    }
}
