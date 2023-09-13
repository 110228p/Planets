//
//  PlanetsApp.swift
//  Planets
//
//  Created by Imesh on 2023-09-13.
//

import SwiftUI

@main
struct PlanetsApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(networkMonitor)
        }
    }
}
