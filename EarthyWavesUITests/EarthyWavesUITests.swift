//
//  EarthyWavesUITests.swift
//  EarthyWavesUITests
//
//  Created by Jorge Ivan Herrera Camara on 10/02/22.
//

import XCTest

class EarthyWavesUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDetailViewControllerAppeared() throws {
        let app = XCUIApplication()
        app.launch()
        let tablesQuery = app.tables
        tablesQuery.cells.allElementsBoundByIndex[0].tap()
        let detailViewController = app.navigationBars["Earthquake detail"]
        XCTAssertTrue(detailViewController.exists)
    }
    
    func testEarthquakeMapAppeared() throws {
        let app = XCUIApplication()
        app.launch()
        let tablesQuery = app.tables
        tablesQuery.cells.allElementsBoundByIndex[0].tap()
        let map = app.scrollViews.otherElements.maps.element
        XCTAssertTrue(map.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
