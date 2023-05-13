//
//  Meal.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import Foundation

struct Meal: Codable {
    let idMeal: String
    let title: String
    let category: String
    let imageUrl: String
    let instructions: String
    let youtube: String
    
    enum CodingKeys: String, CodingKey {
      case idMeal = "idMeal"
      case title = "strMeal"
      case category = "strCategory"
      case instructions = "strInstructions"
      case youtube = "strYoutube"
      case imageUrl = "strMealThumb"
    }
}

extension Meal: Identifiable {
    var id: String { idMeal }
}

extension Meal: Equatable {
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        lhs.id == rhs.id
    }
}
