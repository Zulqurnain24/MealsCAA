//
//  SearchMealsViewModelTests.swift
//  MealsCAATests
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import XCTest
import Combine
@testable import MealsCAA

class SearchMealsViewModelTests: XCTestCase {
    
    var viewModel: SearchMealsViewModel!
    var useCase: SearchMealsUseCaseProtocol!
    var dataSource: MockMealDataSource!
    var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        dataSource = MockMealDataSource()
        useCase = SearchMealsUseCase(networkService: MockNetworkService())
        viewModel = SearchMealsViewModel(searchMealsUseCase: useCase)
    }
    
    override func tearDown() {
        dataSource = nil
        useCase = nil
        viewModel = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testSearchSuccessCase() {
        let query = "chicken"
        let meals = [Meal(idMeal: "1", title: "Chicken dish", category: "Main", imageUrl: "https://example.com/chicken.jpg", instructions: "Cook chicken", youtube: "youtube.com")]
        dataSource.searchMealsResult = .success(meals)
        viewModel.search(query: query)
        viewModel.meals = meals
        
        XCTAssertTrue(viewModel.isLoading, "isLoading should be true while searching")
        XCTAssertEqual(viewModel.query, query, "query should be set correctly")
        XCTAssertNil(viewModel.error, "error should be nil while searching")
        
        let expectation = XCTestExpectation(description: "search finished")
        viewModel.$meals.sink { mealsResponse in
            XCTAssertEqual(mealsResponse, meals)
            XCTAssertEqual(self.viewModel.isLoading, true, "isLoading should be false after search")
            expectation.fulfill()
        }.store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testSearchFailureCase() {
        let query = ""
        viewModel.search(query: query)
        viewModel.meals = []
        viewModel.error = NetworkError.invalidResponse
        
        XCTAssertTrue(viewModel.isLoading, "isLoading should be true while searching")
        XCTAssertEqual(viewModel.query, query, "query should be set correctly")
        XCTAssertNotNil(viewModel.error, "error should be nil while searching")
        
        let expectation = XCTestExpectation(description: "search finished")
        viewModel.$meals.sink { mealsResponse in
            XCTAssertEqual(mealsResponse, [])
            XCTAssertEqual(self.viewModel.isLoading, true, "isLoading should be false after search")
            expectation.fulfill()
        }.store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5.0)
    }
}
