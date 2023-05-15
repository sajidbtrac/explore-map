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
                    findNewLocation()
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

extension MapContentView {
    func findNewLocation() {
        let locationEntered = tbLocationEntered
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(locationEntered, completionHandler: { (placemarks, error) -> Void in
            if error != nil {
                print("error at geocode. \(String(describing: error))")
            }
            
            if let placemark = placemarks?.first {
                let coordinates: CLLocationCoordinate2D = placemark.location!.coordinate
                
                region = MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
                
                annotations.append(Location(name: placemark.name!, coordinate: coordinates))
                
                //directions
                let request = MKDirections.Request()
                request.source = MKMapItem(placemark: MKPlacemark(coordinate: home, addressDictionary: nil))
                request.destination = MKMapItem(placemark: MKPlacemark(coordinate: coordinates, addressDictionary: nil))
                request.requestsAlternateRoutes = false
                request.transportType = .automobile // can try 'walking' or other option also
                
                let directions = MKDirections(request: request)
                directions.calculate(completionHandler: { response, error in
                    for route in (response?.routes)! {
                        self.routeSteps = []
                        
                        for step in route.steps {
                            self.routeSteps.append(RouteSteps(step: step.instructions))
                        }
                    }
                })
            }
        })
    }
}
