//
//  DefaultSearchMealsUseCase.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import Combine

class DefaultSearchMealsUseCase: SearchMealsUseCase {
  private var dataSource: MealDataSource
  
  init(dataSource: MealDataSource) {
    self.dataSource = dataSource
    super.init()
  }
  
  override func execute(query: String) -> AnyPublisher<[Meal], Error> {
    return dataSource.searchMeals(query: query)
  }
}
