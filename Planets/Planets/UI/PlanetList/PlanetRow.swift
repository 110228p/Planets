//
//  PlanetRow.swift
//  Planets
//
//  Created by Imesh on 2023-09-13.
//

import SwiftUI

struct PlanetRow: View {
    let planet: Planet
    
    var body: some View {
        HStack (spacing: 12) {
            AsyncImage(url: URL(string: Constants.IMAGE_URL),
                       content: { image in
                image.resizable().aspectRatio(contentMode: .fit)
            }, placeholder: {
                ProgressView()
            })
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            VStack (alignment: .leading) {
                Text(planet.name)
                    .font(.system(size: 30, weight: .semibold))
                    .padding(.bottom, 5)
                Text(planet.climate)
                    .font(.system(size: 20))
            }
        }.padding(4)
    }
}

struct PlanetRow_Previews: PreviewProvider {
    static var previews: some View {
        PlanetRow(planet: Planet(name: "Abc", climate: "123", orbital_period: "12", gravity: "1"))
    }
}
