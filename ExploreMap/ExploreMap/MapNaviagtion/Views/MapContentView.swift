//
//  MapContentView.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 15/5/23.
//

import SwiftUI
import MapKit

struct MapContentView: View {
    @State private var home = CLLocationCoordinate2D(latitude: 23.790321, longitude: 90.4076959)
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 23.790321, longitude: 90.4076959), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    
    @State var tbLocationEntered: String = ""
    @State var routeSteps: [RouteSteps] = [RouteSteps(step: "Enter a destination")]
    
    @State var annotations = [
        Location(name: "Empire State Building", coordinate: CLLocationCoordinate2D(latitude: 23.790321, longitude: 90.4076959))
    ]
    
    var body: some View {
        VStack {
            HStack {
                TextField("Where do you want to go?", text: $tbLocationEntered)
                Button {
                    //
                } label: {
                    Text("Go!")
                }
                .padding()
            }
            Map(coordinateRegion: $region, annotationItems: annotations) { item in
                MapMarker(coordinate: item.coordinate, tint: .red)
            }
            .frame(width: 400, height: 300)
        }
    }
}

struct MapContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapContentView()
    }
}
