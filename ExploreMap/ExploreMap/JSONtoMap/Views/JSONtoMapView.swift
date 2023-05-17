//
//  JSONtoMapView.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 17/5/23.
//

import SwiftUI
import MapKit

struct JSONtoMapView: View {
    @State private var locations: [LocationFromJSON] = []
    @State private var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.43, longitude: -99.13), span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50))
    
    var body: some View {
        Map(coordinateRegion: $coordinateRegion, annotationItems: locations, annotationContent: { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                VStack {
                    Text(location.name)
                        .font(.caption2)
                        .bold()
                    Image(systemName: "star.fill")
                        .foregroundColor(.red)
                        .font(.title2)
                        .shadow(radius: 1)
                }
            }
        })
        .onAppear(perform: readFile)
        .navigationTitle("Show Locations from JSON")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func readFile() {
        if let url = Bundle.main.url(forResource: "locations", withExtension: "json"),
            let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData = try? decoder.decode(JSONData.self, from: data) {
//                print(jsonData.locations)
                self.locations = jsonData.locations
            }
        }
    }
}

struct JSONtoMapView_Previews: PreviewProvider {
    static var previews: some View {
        JSONtoMapView()
    }
}
