//
//  SearchScreenTests.swift
//  MealsCAAUITests
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import XCTest

class SearchScreenTests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        print("debugDescription: \(app.debugDescription)")
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        app = nil
        try super.tearDownWithError()
    }
    
    func testSearch() throws {
        // wait for the search field to exist
        let searchField = app.textFields["Search Meals"]
        
        let predicate = NSPredicate(format: "exists == true")
        searchField.tap()
        searchField.typeText("chicken")
        
        // ensure the search field exists
        XCTAssertTrue(searchField.exists && searchField.isHittable && searchField.isEnabled, "Search field should be visible and enabled")
        
        app.buttons["Return"].tap()
        
        let expectation1 = XCTNSPredicateExpectation(predicate: predicate, object: searchField)
        XCTWaiter().wait(for: [expectation1], timeout: 5.0)
        
        let collectionView = app.collectionViews.firstMatch
        
        // ensure the search field exists
        XCTAssertTrue(collectionView.exists && collectionView.isHittable && collectionView.isEnabled, "CollectionView should be visible and enabled")
        
        let expectation2 = XCTNSPredicateExpectation(predicate: predicate, object: collectionView)
        XCTWaiter().wait(for: [expectation2], timeout: 5.0)
        
        // Tap the first cell in the collection view
        if collectionView.cells.count > 0 {
            let firstCell = collectionView.cells.element(boundBy: 0)
            firstCell.tap()
        } else {
            XCTFail("No cells found in collection view")
        }
        
    }
    
}
