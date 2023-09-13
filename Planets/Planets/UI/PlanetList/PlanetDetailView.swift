//
//  PlanetDetailView.swift
//  Planets
//
//  Created by Imesh on 2023-09-13.
//

import SwiftUI

struct PlanetDetailView: View {
    let planet: Planet
    
    var body: some View {
        VStack (alignment: .leading, spacing: 12) {
            AsyncImage(url: URL(string: Constants.IMAGE_URL),
                       content: { image in
                image.resizable().aspectRatio(contentMode: .fit)
            }, placeholder: {
                ProgressView()
            })
            Text(planet.name)
                .font(.system(size: 40, weight: .semibold))
            Text(planet.orbital_period)
                .font(.system(size: 20))
            Text(planet.gravity)
                .font(.system(size: 20))
            Spacer()
        }.padding(10).frame(maxWidth: .infinity)
    }
}

struct PlanetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetDetailView(planet: Planet(name: "Abc", climate: "123", orbital_period: "12", gravity: "1"))
    }
}
