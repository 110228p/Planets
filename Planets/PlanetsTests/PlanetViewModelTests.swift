//
//  PlanetViewModelTests.swift
//  PlanetsTests
//
//  Created by Imesh on 2023-09-14.
//

import XCTest
import Combine
@testable import Planets

class PlanetViewModelTests: XCTestCase {
    
    func test_planets_api_success() {
        let mockService = MockPlanetAPIService.shared
        mockService.result = Just(
            PlanetsResponse(
                count: 1,
                next: nil,
                results: [
                    Planet(
                        name: "Planet A",
                        climate: "Dry",
                        orbital_period: "23",
                        gravity: "1"
                    )
                ]
            )
        )
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
        let sut = PlanetViewModel(planetAPIService: mockService)
        let expectation = XCTestExpectation(description: "fetching planets")
        var cancellable: AnyCancellable = sut.$dataList
            .dropFirst()
            .sink(receiveValue: { value in
            expectation.fulfill()
        })
        sut.fetchPlanets(shouldRefresh: false)
        wait(for: [expectation], timeout: 10)
        XCTAssert(sut.dataList.count == 1)
    }
    
    func test_planets_api_failure() {
        let mockService = MockPlanetAPIService.shared
        mockService.result = Fail(error: NSError(
            domain: "Unknown error",
            code: NSURLErrorUnknown
        ))
        .eraseToAnyPublisher()
        let sut = PlanetViewModel(planetAPIService: mockService)
        sut.fetchPlanets(shouldRefresh: false)
        XCTAssert(sut.dataList.isEmpty)
    }
}
