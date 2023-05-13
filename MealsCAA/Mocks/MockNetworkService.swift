//
//  MockNetworkService.swift
//  MealsCAATests
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import Combine
import Foundation

class MockNetworkService: NetworkServiceProtocol {
    var error: Error?
    var meals: [Meal]? = [Meal(idMeal: "1", title: "Chicken Beyti", category: "Chicken", imageUrl: "https://www.themealdb.com/images/media/meals/pkopc31683207947.jpg", instructions: "(1)Chop chicken (2)Put masala (3)Put yogurt (4)Roast it under 160C", youtube: "https://www.youtube.com/watch?v=nE-GAMcqAPQ")]
    
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
