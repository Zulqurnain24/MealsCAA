//
//  SearchMealsViewModelProtocol.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import Foundation

protocol SearchMealsViewModelProtocol: ObservableObject {
  var query: String { get set }
  var meals: [Meal] { get }
  var isLoading: Bool { get }
  var error: NetworkError? { get }
  func refresh()
  func search(query: String)
}
