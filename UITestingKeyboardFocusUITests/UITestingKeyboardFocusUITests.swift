//
//  UITestingKeyboardFocusUITests.swift
//  UITestingKeyboardFocusUITests
//
//  Created by Daniel Loewenherz on 1/3/17.
//  Copyright © 2017 Lionheart Software LLC. All rights reserved.
//

import XCTest

class UITestingKeyboardFocusUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
        let app = XCUIApplication()

        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("1234")

        addUIInterruptionMonitor(withDescription: "Loading") { alert in
            self.expectation(for: NSPredicate(format: "exists == false"), evaluatedWith: alert, handler: nil);
            self.waitForExpectations(timeout: 10, handler: nil)
            return true
        }

        app.buttons["Login"].tap()

        let search = app.tables.searchFields["Search"]
        search.tap()
        search.typeText("test")
        app.buttons["Cancel"].tap()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
