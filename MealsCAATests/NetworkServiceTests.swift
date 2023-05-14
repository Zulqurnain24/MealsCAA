//
//  SearchMealsUseCaseTests.swift
//  MealsCAATests
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import XCTest
import Combine

@testable import MealsCAA

class NetworkServiceTests: XCTestCase {
    
    var sut: MockNetworkService!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        sut = MockNetworkService()
        
        cancellables = []
    }
    
    override func tearDown() {
        cancellables = nil
        sut = nil
        super.tearDown()
    }
    
    func testSearchMealsWithValidQuery() {
        let query = "chicken"
        sut.meals = [Meal.mock()]
        sut.error = nil
        let expectation = XCTestExpectation(description: "Search meals")
        
        sut.searchMeals(query: query)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    XCTFail("Failed with error: \(error)")
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { result in
                XCTAssertNotNil(result.meals)
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testSearchMealsWithInvalidQuery() {
        let query = ""
        sut.meals = []
        sut.error = NetworkError.invalidURL
        let expectation = XCTestExpectation(description: "Search meals")
        
        sut.searchMeals(query: query)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    guard case NetworkError.invalidURL = error else {
                        XCTFail("Failed with unexpected error: \(error)")
                        return
                    }
                case .finished:
                    XCTFail("Expected failure, but received finished.")
                }
                expectation.fulfill()
            } receiveValue: { _ in
                XCTFail("Expected failure, but received value.")
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5)
    }
}
