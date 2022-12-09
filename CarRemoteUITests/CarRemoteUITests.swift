//
//  CarRemoteUITests.swift
//  CarRemoteUITests
//
//  Created by Hayk Hayrapetyan on 08.12.22.
//

import XCTest

final class CarRemoteUITests: XCTestCase {
    
    func testUIUpdateAfterDoorLock() {
        let app = XCUIApplication()
        app.launch()
        
        let lock = app.buttons["lock"]
        XCTAssert(lock.exists)
        lock.tap()
        
        let alertYes = app.alerts["Are you sure?"].buttons["Yes, Lock"]
        XCTAssert(alertYes.exists)
        
        let alertCancel = app.alerts["Are you sure?"].buttons["Cancel"]
        XCTAssert(alertCancel.exists)
        alertYes.tap()
        XCTAssert(!app.buttons["lock"].exists)
        XCTAssert(app.staticTexts["..."].exists)
        XCTAssert(app.buttons["lock"].waitForExistence(timeout: 6))
    }
}
