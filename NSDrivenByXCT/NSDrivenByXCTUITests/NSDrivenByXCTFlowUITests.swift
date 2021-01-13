//
//  NSDrivenByXCTFlowUITests.swift
//  NSDrivenByXCTFlowUITests
//
//  Created by Jerry Ren on 1/13/21.
//

import XCTest

class NSDrivenByXCTFlowUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    override func tearDownWithError() throws {
    }
    func testTemple() throws {
        let applica = XCUIApplication()
        applica.launch()
    }
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
