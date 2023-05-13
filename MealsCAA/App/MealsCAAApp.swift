//
//  MealsCAAApp.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import SwiftUI

@main
struct MealsCAAApp: App {

    var body: some Scene {
        WindowGroup {
          ContentView(viewModel: SearchMealsViewModel(searchMealsUseCase: SearchMealsUseCase(networkService: NetworkService())))
        }
    }
}
