//
//  Location.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 15/5/23.
//

import Foundation
import CoreLocation

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
