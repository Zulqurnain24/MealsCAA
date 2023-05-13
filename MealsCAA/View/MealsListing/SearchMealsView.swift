//
//  MealsView.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import SwiftUI

struct SearchMealsView: View {
  
  @ObservedObject var viewModel: SearchMealsViewModel
  
  var body: some View {
    VStack {
      SearchBar(query: $viewModel.query) { query in
        viewModel.search(query: query)
      }
        .padding()
      if let error = viewModel.error {
        Text(error.localizedDescription)
          .foregroundColor(.red)
          .padding()
      }
      if viewModel.isLoading {
        ProgressView()
          .padding()
      }
      List(viewModel.meals) { meal in
        NavigationLink(destination: MealDetailView(meal: meal)) {
          MealRow(meal: meal)
        }
      }
    }
    .onAppear(perform: viewModel.refresh)
  }
}
