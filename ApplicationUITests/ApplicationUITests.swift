//
//  ApplicationUITests.swift
//  ApplicationUITests
//
//  Created by Tomy Kho on 3/31/17.
//
//

import XCTest

class ApplicationUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launchArguments = ["TEST"]
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.xs
        
        // 1.
        app.buttons["Albums"].tap()
        
        // 2.
        let table = app.tables.element(boundBy: 0)
        table.swipeUp()
        table.swipeDown()
        let cells = table.cells
        XCTAssertGreaterThan(cells.count, 0, "found instead \(cells.debugDescription)")
        let firstCell = cells.element(boundBy: 0)
        firstCell.tap()
        
        // 3.
        let collection = app.collectionViews.element(boundBy: 0)
        collection.swipeUp()
        collection.swipeUp()
        collection.swipeDown()
    }
    
}
