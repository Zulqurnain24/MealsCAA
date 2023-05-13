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
        useCase = DefaultSearchMealsUseCase(dataSource: dataSource!)
        viewModel = SearchMealsViewModel(searchMealsUseCase: useCase)
    }
    
    override func tearDown() {
        dataSource = nil
        useCase = nil
        viewModel = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testSearch() {
        let query = "chicken"
        let meals = [Meal(idMeal: "1", strMeal: "Chicken dish", strCategory: "Main", strMealThumb: "https://example.com/chicken.jpg", strInstructions: "Cook chicken")]
        dataSource.searchMealsResult = .success(meals)
        viewModel.search(query: query)
        viewModel.meals = meals
        
        XCTAssertTrue(viewModel.isLoading, "isLoading should be true while searching")
        XCTAssertEqual(viewModel.query, query, "query should be set correctly")
        XCTAssertNil(viewModel.error, "error should be nil while searching")
        
        let expectation = XCTestExpectation(description: "search finished")
        viewModel.$meals.sink { mealsResponse in
            XCTAssertEqual(mealsResponse, meals, "meals should be set correctly")
            XCTAssertEqual(self.viewModel.isLoading, true, "isLoading should be false after search")
            expectation.fulfill()
        }.store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5.0)
    }
    
}
