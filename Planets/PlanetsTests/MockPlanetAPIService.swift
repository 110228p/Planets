//
//  PlanetAPIMockService.swift
//  PlanetsTests
//
//  Created by Imesh on 2023-09-14.
//

import Foundation
import Combine
@testable import Planets

class MockPlanetAPIService: PlanetAPIServiceDelegate {
    static let shared = MockPlanetAPIService()
    
    var result: AnyPublisher<PlanetsResponse, Error>!
    
    func getPlanets(nextURL: String) -> AnyPublisher<PlanetsResponse, Error> {
        return result
    }
}
