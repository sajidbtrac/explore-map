//
//  LocationFromJSON.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 17/5/23.
//

import Foundation

struct LocationFromJSON: Decodable, Identifiable {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
}

struct JSONData: Decodable {
    let locations: [LocationFromJSON]
}
