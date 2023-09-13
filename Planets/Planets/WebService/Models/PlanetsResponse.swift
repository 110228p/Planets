//
//  PlanetsResponse.swift
//  Planets
//
//  Created by Imesh on 2023-09-13.
//

import Foundation

struct PlanetsResponse: Decodable {
    let count: Int
    let next: String?
    let results: [Planet]
}
