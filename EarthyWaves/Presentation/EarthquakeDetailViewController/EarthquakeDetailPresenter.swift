//
//  EarthquakeDetailPresenter.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 11/02/22.
//

import Foundation

class EarthquakeDetailPresenter: EarthquakeDetailViewPresenter {
    // MARK: - Delegate
    weak fileprivate var view: EarthquakeDetailView?
    
    required init(view: EarthquakeDetailView) {
        self.view = view
    }
}
