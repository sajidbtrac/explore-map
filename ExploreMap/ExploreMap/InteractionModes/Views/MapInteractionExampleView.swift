//
//  MapInteractionExampleView.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 17/5/23.
//

import SwiftUI
import MapKit

struct MapInteractionExampleView: View {
    enum interactionMode {
        case all, onlyPan, onlyZoom, nothing
    }
    let interaction: interactionMode
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 23.791113400762203, longitude: 90.40353778273963), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.5))
    
    var body: some View {
        switch interaction {
        case .all:
            Map(coordinateRegion: $region, interactionModes: [.all])
                .navigationTitle("Default Interaction")
                .navigationBarTitleDisplayMode(.inline)
        case .onlyPan:
            Map(coordinateRegion: $region, interactionModes: [.pan])
                .navigationTitle("Only Pan")
                .navigationBarTitleDisplayMode(.inline)
        case .onlyZoom:
            Map(coordinateRegion: $region, interactionModes: [.zoom])
                .navigationTitle("Only Zoom")
                .navigationBarTitleDisplayMode(.inline)
        case .nothing:
            Map(coordinateRegion: $region, interactionModes: [])
                .navigationTitle("No Interaction")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MapInteractionExampleView_Previews: PreviewProvider {
    static var previews: some View {
        MapInteractionExampleView(interaction: .all)
    }
}
