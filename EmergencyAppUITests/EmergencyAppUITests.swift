//
//  EmergencyAppUITests.swift
//  EmergencyAppUITests
//
//  Created by 지준용 on 2022/04/26.
//

import XCTest

class EmergencyAppUITests: XCTestCase {

    override func setUpWithError() throws {
        
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
