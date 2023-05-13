//
//  SearchMealModel.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import Combine
import Foundation

class SearchMealsViewModel: SearchMealsViewModelProtocol {
  
  @Published var query: String = ""
  @Published var meals: [Meal] = []
  @Published var isLoading: Bool = false
  @Published var error: NetworkError?
  
  private let searchMealsUseCase: SearchMealsUseCaseProtocol
  private var cancellables = Set<AnyCancellable>()
  
  init(searchMealsUseCase: SearchMealsUseCaseProtocol) {
    self.searchMealsUseCase = searchMealsUseCase
  }
  
  func refresh() {
    guard !query.isEmpty else { return }
    search(query: query)
  }
  
  func search(query: String) {
    self.query = query
    isLoading = true
    error = nil
    searchMealsUseCase.execute(query: query)
      .receive(on: DispatchQueue.main)
      .sink { [weak self] completion in
        guard let self = self else { return }
        switch completion {
        case .failure(let error):
          self.error = error as? NetworkError
          self.meals = []
        case .finished:
          self.isLoading = false
        }
      } receiveValue: { [weak self] meals in
        guard let self = self else { return }
        self.meals = meals
      }
      .store(in: &cancellables)
  }
}
