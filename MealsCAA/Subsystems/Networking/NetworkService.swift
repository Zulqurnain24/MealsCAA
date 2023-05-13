//
//  NetworkService.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import Combine
import Foundation

protocol NetworkServiceProtocol {
    func searchMeals(query: String) -> AnyPublisher<SearchMealsResponse, any Error>
}

struct NetworkService: NetworkServiceProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func searchMeals(query: String) -> AnyPublisher<SearchMealsResponse, any Error> {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(query)") else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        let request = URLRequest(url: url)
        
        return session.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200..<300).contains(httpResponse.statusCode) else {
                    throw NetworkError.invalidResponse
                }
                return data
            }
            .decode(type: SearchMealsResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
