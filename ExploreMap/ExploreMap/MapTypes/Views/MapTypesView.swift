//
//  MapTypesView.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 17/5/23.
//

import SwiftUI
import MapKit

struct MapTypesView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 23.791113400762203, longitude: 90.40353778273963), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State private var mapType: MKMapType = .standard

    
    var body: some View {
        ZStack {
            MapViewRepresentable(region: region, mapType: mapType)
            
            VStack {
                Spacer()
                
                Picker("", selection: $mapType) {
                    Text("Standerd").tag(MKMapType.standard)
                    Text("Hybrid").tag(MKMapType.hybrid)
                    Text("Satellite").tag(MKMapType.satellite)
                }
                .pickerStyle(.segmented)
                .padding()
            }
            .offset(y: -50)
        }
    }
}

struct MapTypesView_Previews: PreviewProvider {
    static var previews: some View {
        MapTypesView()
    }
}
