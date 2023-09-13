//
//  ContentView.swift
//  Planets
//
//  Created by Imesh on 2023-09-13.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var planetViewModel = PlanetViewModel()
    @State private var showNetworkAlert = false
    
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
        .onChange(of: networkMonitor.isConnected) { connection in
            showNetworkAlert = connection == false
        }
        .alert(
            "Network connection seems to be offline.",
            isPresented: $showNetworkAlert
        ) {
            Button("OK", role: .cancel) {
                showNetworkAlert = false
            }
        }
    }
    
    private func fetchData() {
        if (networkMonitor.isConnected) {
            showNetworkAlert = false
            planetViewModel.fetchPlanets(shouldRefresh: false)
        } else {
            showNetworkAlert = true
        }
    }
    
    private func refreshData() {
        if (networkMonitor.isConnected) {
            showNetworkAlert = false
            planetViewModel.fetchPlanets(shouldRefresh: true)
        } else {
            showNetworkAlert = true
        }
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
