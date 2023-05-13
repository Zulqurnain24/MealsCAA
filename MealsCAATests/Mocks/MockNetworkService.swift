//
//  MockNetworkService.swift
//  MealsCAATests
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import Combine
import Foundation

@testable import MealsCAA

class MockNetworkService: NetworkServiceProtocol {
    var error: Error?
    var meals: [Meal]?
    
    func searchMeals(query: String) -> AnyPublisher<SearchMealsResponse, Error> {
        if let error = error {
            return Fail(error: error).eraseToAnyPublisher()
        } else if query == "chicken",
                 let meals = meals {
            let response = SearchMealsResponse(meals: meals)
            return Just(response)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: NetworkError.unknownError).eraseToAnyPublisher()
        }
    }
}
