//
//  PlanetViewModel.swift
//  Planets
//
//  Created by Imesh on 2023-09-13.
//

import Foundation
import Combine

class PlanetViewModel: BaseAPIViewModel<Planet> {
    @Published var shouldFetchData = true
    
    private let planetAPIService: PlanetAPIServiceDelegate
    
    private let pageLimit = 10
    private var nextURL = Constants.PLANET_URL
    
    private var cancellable: AnyCancellable?
    
    init(planetAPIService: PlanetAPIServiceDelegate = PlanetAPIService.shared) {
        self.planetAPIService = planetAPIService
    }
    
    func fetchPlanets(shouldRefresh: Bool) {
        self.apiState = APIState.inProgress
        cancellable = planetAPIService.getPlanets(nextURL: shouldRefresh ? Constants.PLANET_URL : nextURL)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.apiState = APIState.failed
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { response in
                if (shouldRefresh) {
                    self.dataList = response.results
                } else {
                    self.dataList.append(contentsOf: response.results)
                }
                self.shouldFetchData = response.next != nil
                self.nextURL = response.next != nil ? response.next! : Constants.PLANET_URL
                self.apiState = APIState.succeed
        }
    }
}
