//
//  MealDetailView.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import SwiftUI

struct MealDetailView: View {
    let meal: Meal
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    AsyncImage(url: URL(string: meal.imageUrl)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    Text(meal.title)
                        .font(.title)
                    Text(meal.category)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(meal.instructions)
                      .font(.body)
                      .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal)
                .navigationBarTitleDisplayMode(.inline)
            }.navigationTitle("Detail View")
        }
    }
}
