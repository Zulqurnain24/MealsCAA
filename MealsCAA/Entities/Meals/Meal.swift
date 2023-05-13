//
//  Meal.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import Foundation

struct Meal: Codable {
  let idMeal: String
  let strMeal: String
  let strCategory: String
  let strMealThumb: String
  let strInstructions: String
}

extension Meal: Identifiable {
  var id: String { "\((idMeal))" }
}

extension Meal: Equatable {
  static func == (lhs: Meal, rhs: Meal) -> Bool {
    lhs.id == rhs.id
  }
}
