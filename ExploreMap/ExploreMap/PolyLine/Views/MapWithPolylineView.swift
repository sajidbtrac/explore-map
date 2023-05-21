//
//  MapWithPolylineView.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 21/5/23.
//

import SwiftUI
import MapKit

struct MapWithPolylineView: View {
    @State private var lineCoordinates: [CLLocationCoordinate2D] = [
      // Burger King
      CLLocationCoordinate2D(latitude: 23.791123864272194, longitude: 90.40354192527751),
      // Herfy
      CLLocationCoordinate2D(latitude: 23.791359475003336, longitude: 90.40202915940239),
      // Star Kabab
      CLLocationCoordinate2D(latitude: 23.793332698107395, longitude:  90.4028874662819),
      // Chillox
      CLLocationCoordinate2D(latitude: 23.793951164853347, longitude:  90.40451824935295),
      //takeout
      CLLocationCoordinate2D(latitude: 23.793141850696788, longitude:  90.40574493776502),
    ];
    
    @State private var region = MKCoordinateRegion(
      center: CLLocationCoordinate2D(latitude: 23.791123864272194, longitude: 90.40354192527751),
      span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )

    var body: some View {
        MapWithPolyline(region: region, lineCoordinates: lineCoordinates)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MapWithPolylineView_Previews: PreviewProvider {
    static var previews: some View {
        MapWithPolylineView()
    }
}
