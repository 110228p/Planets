//
//  ContentView.swift
//  Planets
//
//  Created by Imesh on 2023-09-13.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var planetViewModel = PlanetViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(planetViewModel.dataList, id: \.name) { planet in
                    NavigationLink {
                        PlanetDetailView(planet: planet)
                    } label: {
                        PlanetRow(planet: planet)
                    }
                }
                if (planetViewModel.shouldFetchData) {
                    LoaderView(isFailed: planetViewModel.apiState == APIState.failed)
                        .onAppear(perform: fetchData)
                        .onTapGesture(perform: onTapLoadView)
                }
            }
            .refreshable {
                refreshData()
            }
            .navigationTitle("Planets")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    private func fetchData() {
        planetViewModel.fetchPlanets(shouldRefresh: false)
    }
    
    private func refreshData() {
        planetViewModel.fetchPlanets(shouldRefresh: true)
    }
    
    private func onTapLoadView() {
        if planetViewModel.apiState == APIState.failed {
            fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
