//
//  NetworkError.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

enum NetworkError: Error {
  case invalidURL
  case invalidResponse
  case serverError(statusCode: Int)
  case unknownError
}
