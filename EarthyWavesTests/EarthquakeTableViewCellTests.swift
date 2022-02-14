//
//  EarthquakeTableViewCellTests.swift
//  EarthyWavesTests
//
//  Created by Jorge Ivan Herrera Camara on 12/02/22.
//

import XCTest
@testable import EarthyWaves

class EarthquakeTableViewCellTests: XCTestCase {
    var sut: EarthquakeTableViewCell!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = EarthquakeTableViewCell()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testScoreIfMagnitudeLevelIsDistinguishable() {
        var testEarthquake: Earthquake?
        testEarthquake = Earthquake(
            id: "1234",
            date: Date(),
            latitude: -14.3,
            longitude: 23.3,
            depth: 4.4,
            magnitude: 8.8,
            source: "us")
        sut.earthquake = testEarthquake
        sut.updateView()
        XCTAssertEqual(sut.earthquakeMagnitudeLabel.textColor, .red, "Magnitude should be distinguisable is wrong")
    }
    
    func testScoreIfMagnitudeLevelIsNormal() {
        var testEarthquake: Earthquake?
        testEarthquake = Earthquake(
            id: "1234",
            date: Date(),
            latitude: -14.3,
            longitude: 23.3,
            depth: 4.4,
            magnitude: 4.8,
            source: "us")
        sut.earthquake = testEarthquake
        sut.updateView()
        XCTAssertEqual(sut.earthquakeMagnitudeLabel.textColor, .white, "Magnitude should be normal is wrong")
    }

}
