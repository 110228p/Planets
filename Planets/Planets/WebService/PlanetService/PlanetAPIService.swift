//
//  PlanetService.swift
//  Planets
//
//  Created by M-DAQ on 2023-09-14.
//

import Foundation
import Combine

class PlanetAPIService: APIService {
    static let shared = PlanetAPIService()
    
    func getPlanets(nextURL: String) -> AnyPublisher<PlanetsResponse, Error> {
        return session.dataTaskPublisher(for: URLRequest(url: URL(string: nextURL)!) )
            .map(\.data)
            .decode(type: PlanetsResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
