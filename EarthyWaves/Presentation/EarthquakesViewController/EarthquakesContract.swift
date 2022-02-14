//
//  EarthquakeContract.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 10/02/22.
//

import Foundation

protocol EarthquakesViewPresenter {
    // This initializer will set the current service and view to be used by the presenter
    init(view: EarthquakesView, earthquakeService: EarthquakesAPIProtocol)
    // This method trigger an asynchronous call to the earthquakes service to get all earthquakes
    func getEarthquakes()
}

protocol EarthquakesView: NSObjectProtocol {
    // This method will reload the earthquakes list and update the earthquakes table view
    func updateEarthquakesList(earthquakes: [Earthquake])
    
    // This method show an alert if no earthquakes are available
    func showAlert(title: String, message: String, action: String)
}

