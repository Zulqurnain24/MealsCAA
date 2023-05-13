//
//  NetworkError.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

enum NetworkError: Error {
  case invalidURL
  case invalidResponse
  case decodingError
  case serverError(statusCode: Int)
  case requestError
  case unknownError
}
