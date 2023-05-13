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
