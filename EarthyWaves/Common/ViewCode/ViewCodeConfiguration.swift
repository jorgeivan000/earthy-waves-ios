//
//  ViewCodeConfiguration.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 10/02/22.
//

import Foundation

protocol ViewCodeConfiguration {
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCodeConfiguration {
    func configureViews(){}
    func applyViewCode(){
        buildHierarchy()
        setupConstraints()
    }
}
