//
//  MealRow.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import SwiftUI

struct MealRow: View {
  var meal: Meal
  
  var body: some View {
    GeometryReader { geometry in
      VStack{
        HStack{
            AsyncImage(url: URL(string: meal.imageUrl)) { image in
            image
              .resizable()
              .frame(width: geometry.size.width * 0.2, height: geometry.size.width * 0.2)
          } placeholder: {
            ProgressView()
          }
            Text("\(meal.title)")
        }
      }
    }
  }
}
