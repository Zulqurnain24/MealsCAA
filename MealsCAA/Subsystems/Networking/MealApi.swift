//
//  MealApi.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import Combine
import Foundation

protocol MealDataSource {
  func searchMeals(query: String) -> AnyPublisher<[Meal], Error>
}

class MealAPI: MealDataSource {
  func searchMeals(query: String) -> AnyPublisher<[Meal], Error> {
    guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(query)") else {
      return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
    }
    
    let request = URLRequest(url: url)
    return URLSession.shared.dataTaskPublisher(for: request)
      .map { $0.data }
      .decode(type: MealAPIResponse.self, decoder: JSONDecoder())
      .map { $0.meals }
      .eraseToAnyPublisher()
  }
}
