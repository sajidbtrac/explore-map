//
//  Business.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 15/5/23.
//

import Foundation
import MapKit

struct Business: Identifiable {
    let id = UUID()
    let name: String
    let placemark: MKPlacemark
    let coordinate:CLLocationCoordinate2D
    let phoneNumber: String
    let website: URL?
}
