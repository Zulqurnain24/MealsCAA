//
//  Meal+Mock.swift
//  MealsCAA
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import Foundation

extension Meal {
    static func mock() -> Meal {
        Meal(idMeal: "1", title: "Chicken Beyti", category: "Chicken", imageUrl: "chicken.jpg", instructions: "(1)Boil chicken (2)Put spice (3)Garnish", youtube: "youtube.com/chicken")
    }
}
