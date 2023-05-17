//
//  ContentView.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 15/5/23.
//

import SwiftUI

struct ContentViewTest: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    CurrentLocationView()
                } label: {
                    Text("User Current Location")
                }
                
                NavigationLink {
                    MapSearchMainView()
                } label: {
                    Text("Map Search by keyword")
                }
                
                NavigationLink {
                    MapNaviagtionMainView()
                } label: {
                    Text("Map Naviagtion(try)")
                        .foregroundColor(.secondary)
                }

                NavigationLink {
                    MapDirectionsView()
                } label: {
                    Text("Map Route & Directions")
                }

                NavigationLink {
                    GeofenceView()
                } label: {
                    Text("Geofence (error)")
                        .foregroundColor(.secondary)
                }
                
                NavigationLink {
                    JSONtoMapView()
                } label: {
                    Text("JSON to Map")
                }
            }
            .listStyle(.inset)
            .navigationTitle("Explore Map")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTest()
    }
}
