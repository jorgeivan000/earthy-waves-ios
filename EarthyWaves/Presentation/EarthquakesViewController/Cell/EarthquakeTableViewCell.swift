//
//  CustomCell.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 11/02/22.
//

import Foundation
import UIKit

class EarthquakeTableViewCell: UITableViewCell {
    // MARK: - Cell Identifier
    static var cellId = "EarthquakeTableViewCell"
    
    // MARK: - Variables
    var earthquake: Earthquake?
    
    // MARK: - Views
    let earthquakeStackView: UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        stk.layer.cornerRadius = 3
        stk.layer.masksToBounds = true
        stk.distribution = .fillEqually
        stk.alignment = .fill
        return stk
    }()
    
    let earthquakeMagnitudeStackView: UIStackView = {
        let stk = UIStackView()
        stk.backgroundColor = .blue
        stk.axis = .vertical
        stk.layer.cornerRadius = 3
        stk.layer.masksToBounds = true
        stk.distribution = .fillEqually
        stk.alignment = .fill
        return stk
    }()
    
    let earthquakeMagnitudeTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Magnitude"
        lbl.textColor = .white
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 3
        lbl.layer.masksToBounds = true
        return lbl
    }()
    
    let earthquakeMagnitudeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 3
        lbl.layer.masksToBounds = true
        return lbl
    }()
    
    let earthquakeDepthStackView: UIStackView = {
        let stk = UIStackView()
        stk.backgroundColor = .orange
        stk.axis = .vertical
        stk.layer.cornerRadius = 3
        stk.layer.masksToBounds = true
        stk.distribution = .fillEqually
        stk.alignment = .fill
        return stk
    }()
    
    let earthquakeDepthTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Depth"
        lbl.textColor = .white
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 3
        lbl.layer.masksToBounds = true
        return lbl
    }()
    
    let earthquakeDepthLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 3
        lbl.layer.masksToBounds = true
        return lbl
    }()
    
    let earthquakeIdStackView: UIStackView = {
        let stk = UIStackView()
        stk.backgroundColor = .purple
        stk.axis = .horizontal
        stk.layer.cornerRadius = 3
        stk.layer.masksToBounds = true
        stk.distribution = .fillProportionally
        stk.alignment = .fill
        return stk
    }()
    
    let earthquakeIdTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Id:"
        lbl.textColor = .white
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 3
        lbl.layer.masksToBounds = true
        return lbl
    }()
    
    let earthquakeIdLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 3
        lbl.layer.masksToBounds = true
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.applyViewCode()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView() {
        if let currentEarthquake = earthquake {
            if let currentId = currentEarthquake.id {
                earthquakeIdLabel.text = currentId
            }
            
            if let currentDepth = currentEarthquake.depth {
                earthquakeDepthLabel.text = String(currentDepth)
            }
            
            if let currentMagnitude = currentEarthquake.magnitude {
                earthquakeMagnitudeLabel.text = String(currentMagnitude)
            }
            earthquakeMagnitudeLabel.textColor = currentEarthquake.isMagnitudeCritical ? UIColor.red : UIColor.white
        }
    }
}

// MARK: - ViewCodeConfiguration
extension EarthquakeTableViewCell: ViewCodeConfiguration {
    func buildHierarchy() {
        self.addSubview(earthquakeStackView)
        
        self.earthquakeStackView.addArrangedSubview(earthquakeIdStackView)
        self.earthquakeIdStackView.addArrangedSubview(earthquakeIdTitle)
        self.earthquakeIdStackView.addArrangedSubview(earthquakeIdLabel)
        
        self.earthquakeStackView.addArrangedSubview(earthquakeDepthStackView)
        self.earthquakeDepthStackView.addArrangedSubview(earthquakeDepthTitle)
        self.earthquakeDepthStackView.addArrangedSubview(earthquakeDepthLabel)
        
        self.earthquakeStackView.addArrangedSubview(earthquakeMagnitudeStackView)
        self.earthquakeMagnitudeStackView.addArrangedSubview(earthquakeMagnitudeTitle)
        self.earthquakeMagnitudeStackView.addArrangedSubview(earthquakeMagnitudeLabel)
    }
    
    func setupConstraints() {
        earthquakeStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            earthquakeStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            earthquakeStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant:  -10),
            earthquakeStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            earthquakeStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10)
        ])
    }
    
    func configureViews() {}
}
