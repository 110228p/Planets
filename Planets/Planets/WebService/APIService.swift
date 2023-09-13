//
//  APIService.swift
//  Planets
//
//  Created by Imesh on 2023-09-13.
//

import Foundation
import Combine

class APIService {
    static let shared = APIService()
    private let session = URLSession.shared
    
    func getPlanets(nextURL: String) -> AnyPublisher<PlanetsResponse, Error> {
        return session.dataTaskPublisher(for: URLRequest(url: URL(string: nextURL)!) )
            .map(\.data)
            .decode(type: PlanetsResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
