//
//  MapViewRepresentable.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 17/5/23.
//

import Foundation
import SwiftUI
import MapKit

struct MapViewRepresentable: UIViewRepresentable {
    typealias UIViewType = MKMapView
    
    let region: MKCoordinateRegion
    let mapType: MKMapType
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.setRegion(region, animated: false)
        mapView.mapType = mapType
        mapView.isRotateEnabled = false
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.mapType = mapType
    }

    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator()
    }
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        //
    }
}
