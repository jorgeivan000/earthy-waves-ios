//
//  EarthquakeDetailViewController.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 11/02/22.
//

import Foundation
import UIKit
import MapKit

class EarthquakeDetailViewController: UIViewController {
    // MARK: - Views
    lazy var scrollViewContainer: UIScrollView = { return UIScrollView(frame: .zero)}()
    lazy var earthquakeDetailView: UIView = { return UIView(frame: .zero)}()
    lazy var earthquakeIdLabel: UILabel = { return UILabel(frame: .zero)}()
    lazy var earthquakeDateLabel: UILabel = { return UILabel(frame: .zero)}()
    lazy var earthquakeDepthLabel: UILabel = { return UILabel(frame: .zero)}()
    lazy var earthquakeSourceLabel: UILabel = { return UILabel(frame: .zero)}()
    lazy var earthquakeMagnitudeLabel: UILabel = { return UILabel(frame: .zero)}()
    lazy var earthquakeLatitudeLabel: UILabel = { return UILabel(frame: .zero)}()
    lazy var earthquakeLongitudeLabel: UILabel = { return UILabel(frame: .zero)}()
    lazy var mapViewContainer: UIView = { return UIView(frame: .zero)}()
    
    // MARK: - Variables
    var mapView = MKMapView()
    var earthquake: Earthquake?
    
    // MARK: - Presenter
    fileprivate var presenter: EarthquakeDetailPresenter?
    
    override func loadView() {
        super.loadView()
        applyViewCode()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = EarthquakeDetailPresenter(view: self)
        configureViews()
        if let lat = earthquake?.latitude, let lng = earthquake?.longitude {
            configureMap(lat: lat, lng: lng)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let leftMargin:CGFloat = 10
        let topMargin:CGFloat = 10
        let mapWidth:CGFloat = view.frame.size.width-16
        let mapHeight:CGFloat = 180
        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
    }
}

// MARK: - ViewCodeConfiguration
extension EarthquakeDetailViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        view.addSubview(scrollViewContainer)
        self.scrollViewContainer.addSubview(earthquakeDetailView)
        self.earthquakeDetailView.addSubview(earthquakeIdLabel)
        self.earthquakeDetailView.addSubview(earthquakeDateLabel)
        self.earthquakeDetailView.addSubview(earthquakeDepthLabel)
        self.earthquakeDetailView.addSubview(earthquakeSourceLabel)
        self.earthquakeDetailView.addSubview(earthquakeMagnitudeLabel)
        self.earthquakeDetailView.addSubview(earthquakeLatitudeLabel)
        self.earthquakeDetailView.addSubview(earthquakeLongitudeLabel)
        self.earthquakeDetailView.addSubview(mapViewContainer)
    }
    
    func setupConstraints() {
        scrollViewContainer.translatesAutoresizingMaskIntoConstraints = false
        earthquakeDetailView.translatesAutoresizingMaskIntoConstraints = false
        earthquakeIdLabel.translatesAutoresizingMaskIntoConstraints = false
        earthquakeDateLabel.translatesAutoresizingMaskIntoConstraints = false
        earthquakeDepthLabel.translatesAutoresizingMaskIntoConstraints = false
        earthquakeSourceLabel.translatesAutoresizingMaskIntoConstraints = false
        earthquakeMagnitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        earthquakeLatitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        earthquakeLongitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        mapViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollViewContainer.topAnchor.constraint(equalTo: view.topAnchor),
            scrollViewContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollViewContainer.leftAnchor.constraint(equalTo: view.leftAnchor)
          ])

        NSLayoutConstraint.activate([
            earthquakeDetailView.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor),
            earthquakeDetailView.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor),
            earthquakeDetailView.bottomAnchor.constraint(equalTo: scrollViewContainer.bottomAnchor),
            earthquakeDetailView.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor),
            earthquakeDetailView.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor),
            earthquakeDetailView.heightAnchor.constraint(equalToConstant: 550)
        ])
        
        NSLayoutConstraint.activate([
            earthquakeIdLabel.widthAnchor.constraint(equalTo: earthquakeDetailView.widthAnchor),
            earthquakeIdLabel.heightAnchor.constraint(equalToConstant: 50),
            earthquakeIdLabel.topAnchor.constraint(equalTo: earthquakeDetailView.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            earthquakeDateLabel.widthAnchor.constraint(equalTo: earthquakeDetailView.widthAnchor),
            earthquakeDateLabel.heightAnchor.constraint(equalToConstant: 50),
            earthquakeDateLabel.topAnchor.constraint(equalTo: earthquakeIdLabel.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            earthquakeDepthLabel.widthAnchor.constraint(equalTo: earthquakeDetailView.widthAnchor),
            earthquakeDepthLabel.heightAnchor.constraint(equalToConstant: 50),
            earthquakeDepthLabel.topAnchor.constraint(equalTo: earthquakeDateLabel.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            earthquakeSourceLabel.widthAnchor.constraint(equalTo: earthquakeDetailView.widthAnchor),
            earthquakeSourceLabel.heightAnchor.constraint(equalToConstant: 50),
            earthquakeSourceLabel.topAnchor.constraint(equalTo: earthquakeDepthLabel.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            earthquakeMagnitudeLabel.widthAnchor.constraint(equalTo: earthquakeDetailView.widthAnchor),
            earthquakeMagnitudeLabel.heightAnchor.constraint(equalToConstant: 50),
            earthquakeMagnitudeLabel.topAnchor.constraint(equalTo: earthquakeSourceLabel.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            earthquakeLatitudeLabel.widthAnchor.constraint(equalTo: earthquakeDetailView.widthAnchor),
            earthquakeLatitudeLabel.heightAnchor.constraint(equalToConstant: 50),
            earthquakeLatitudeLabel.topAnchor.constraint(equalTo: earthquakeMagnitudeLabel.bottomAnchor)
        ])
       
        NSLayoutConstraint.activate([
            earthquakeLongitudeLabel.widthAnchor.constraint(equalTo: earthquakeDetailView.widthAnchor),
            earthquakeLongitudeLabel.heightAnchor.constraint(equalToConstant: 50),
            earthquakeLongitudeLabel.topAnchor.constraint(equalTo: earthquakeLatitudeLabel.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mapViewContainer.widthAnchor.constraint(equalTo: earthquakeDetailView.widthAnchor),
            mapViewContainer.heightAnchor.constraint(equalToConstant: 200),
            mapViewContainer.topAnchor.constraint(equalTo: earthquakeLongitudeLabel.bottomAnchor)
        ])
    }
    
    func configureViews() {
        self.earthquakeDetailView.backgroundColor = .white
        self.earthquakeIdLabel.backgroundColor = .orange
        self.earthquakeIdLabel.textColor = .white
        if let id = earthquake?.id {
            self.earthquakeIdLabel.text = "Id: \(id)"
        }
        
        self.earthquakeDateLabel.backgroundColor = .blue
        self.earthquakeDateLabel.textColor = .white
        if let date = earthquake?.date {
            self.earthquakeDateLabel.text = "Date: \(DateHelper.string(from: date, using: CustomDateFormat.dateAndHour))"
        }
        
        self.earthquakeDepthLabel.backgroundColor = .darkGray
        self.earthquakeDepthLabel.textColor = .white
        if let depth = earthquake?.depth {
            self.earthquakeDepthLabel.text = "Depth: \(depth)"
        }
        
        self.earthquakeSourceLabel.backgroundColor = .red
        self.earthquakeSourceLabel.textColor = .white
        if let source = earthquake?.source {
            self.earthquakeSourceLabel.text = "Source: \(source)"
        }
        
        self.earthquakeMagnitudeLabel.backgroundColor = .purple
        self.earthquakeMagnitudeLabel.textColor = .white
        if let magnitude = earthquake?.magnitude {
            self.earthquakeMagnitudeLabel.text = "Magnitude: \(magnitude)"
        }
        
        self.earthquakeLatitudeLabel.backgroundColor = .brown
        self.earthquakeLatitudeLabel.textColor = .white
        if let latitude = earthquake?.latitude {
            self.earthquakeLatitudeLabel.text = "Latitude: \(latitude)"
        }
        
        self.earthquakeLongitudeLabel.backgroundColor = .black
        self.earthquakeLongitudeLabel.textColor = .white
        if let longitude = earthquake?.longitude {
            self.earthquakeLongitudeLabel.text = "Longitude: \(longitude)"
        }
        
        self.mapViewContainer.backgroundColor = .yellow
        self.title = "Earthquake detail"
        
        
    }
    
    func configureMap(lat: Double, lng: Double) {
        let leftMargin:CGFloat = 10
        let topMargin:CGFloat = 10
        let mapWidth:CGFloat = view.frame.size.width-16
        let mapHeight:CGFloat = 180
        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.centerCoordinate.latitude = lat
        mapView.centerCoordinate.longitude = lng
        let annotation = MKPointAnnotation()
        annotation.title = "Earthquake"
        annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat),
                                                        longitude: CLLocationDegrees(lng))
        mapView.addAnnotation(annotation)
        self.mapViewContainer.addSubview(mapView)
    }
}

// MARK: - EarthquakeDetailView
extension EarthquakeDetailViewController: EarthquakeDetailView {}
