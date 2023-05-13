//
//  MockMealDataSource.swift
//  MealsCAATests
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import Combine
import Foundation

class MockMealDataSource: MealDataSource {
    
    var searchMealsResult: Result<[Meal], Error>?
    
    func searchMeals(query: String) -> AnyPublisher<[Meal], Error> {
        if let result = searchMealsResult {
            return result.publisher.eraseToAnyPublisher()
        } else {
            return Fail(error: NetworkError.unknownError).eraseToAnyPublisher()
        }
    }
    
}
