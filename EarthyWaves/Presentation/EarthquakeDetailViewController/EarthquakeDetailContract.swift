//
//  EarthquakeDetailContract.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 11/02/22.
//

import Foundation
protocol EarthquakeDetailViewPresenter {
    // This initializer will provide the view to the presenter
    init(view: EarthquakeDetailView)
}

protocol EarthquakeDetailView: NSObjectProtocol {}
