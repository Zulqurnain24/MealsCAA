//
//  SearchMealsUseCaseTests.swift
//  MealsCAATests
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import Combine
import XCTest

@testable import MealsCAA

final class SearchMealsUseCaseTests: XCTestCase {

    var sut: SearchMealsUseCase? = nil
    var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        sut = SearchMealsUseCase(networkService: MockNetworkService())
        cancellables = []
    }

    override func tearDownWithError() throws {
        sut = nil
        cancellables = nil
    }
    
    func testSearchSuccessCase() throws {
        let expectation = XCTestExpectation(description: "execute")
        sut?.execute(query: "chicken")
            .sink { completion in
                switch completion {
                case .failure(let error):
                    XCTFail("Failed with error: \(error)")
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { meals in
                XCTAssertNotNil(meals)
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testSearchFailureCase() throws {
        let expectation = XCTestExpectation(description: "execute")
        sut?.execute(query: "")
            .sink { completion in
                switch completion {
                case .failure(let error):
                    XCTFail("Failed with error: \(error)")
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { meals in
                XCTAssertNil(meals)
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5)
    }
}
