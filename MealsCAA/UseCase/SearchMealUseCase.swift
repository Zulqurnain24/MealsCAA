//
//  SearchMealUseCase.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import Combine

protocol SearchMealsUseCaseProtocol {
  func execute(query: String) -> AnyPublisher<[Meal], Error>
}

class SearchMealsUseCase: SearchMealsUseCaseProtocol {
    let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }

    func execute(query: String) -> AnyPublisher<[Meal], Error> {
        return networkService
            .searchMeals(query: query)
            .map { response in
                response.meals
            }
            .eraseToAnyPublisher()
    }
}
