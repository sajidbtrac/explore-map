//
//  MapWithUserLocationView.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 18/5/23.
//

import SwiftUI
import MapKit

struct MapWithUserLocationView: View {
    @StateObject private var locationManager = LocationManager()
    
    var region: Binding<MKCoordinateRegion>? {
        guard let location = locationManager.location else {
            return MKCoordinateRegion.goldenGetRegion().getBinding()
        }
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
        
        return region.getBinding()
    }
    
    var body: some View {
        if let region = region {
            Map(coordinateRegion: region, interactionModes: .all, showsUserLocation: true, userTrackingMode: .constant(.follow)) // map updates by following the user's location
        }
    }
}

struct MapWithUserLocationView_Previews: PreviewProvider {
    static var previews: some View {
        MapWithUserLocationView()
    }
}
