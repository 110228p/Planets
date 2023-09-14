//
//  PlanetService.swift
//  Planets
//
//  Created by Imesh on 2023-09-14.
//

import Foundation
import Combine

protocol PlanetAPIServiceDelegate {
    func getPlanets(nextURL: String) -> AnyPublisher<PlanetsResponse, Error>
}

class PlanetAPIService: APIService, PlanetAPIServiceDelegate {
    static let shared = PlanetAPIService()
    
    func getPlanets(nextURL: String) -> AnyPublisher<PlanetsResponse, Error> {
        return session.dataTaskPublisher(for: URLRequest(url: URL(string: nextURL)!) )
            .map(\.data)
            .decode(type: PlanetsResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
