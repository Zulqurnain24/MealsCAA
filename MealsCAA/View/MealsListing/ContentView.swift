//
//  ContentView.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import Combine
import SwiftUI

struct ContentView: View {
  
  @StateObject var viewModel: SearchMealsViewModel
  
  var body: some View {
    NavigationView {
      SearchMealsView(viewModel: viewModel)
        .navigationTitle("Meals")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SearchMealsViewModel(searchMealsUseCase: SearchMealsUseCase(networkService: MockNetworkService())))
    }
}
