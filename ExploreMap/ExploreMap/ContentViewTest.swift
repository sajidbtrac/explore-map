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
                    InteractionModesView()
                } label: {
                    Text("Map Interaction Modes")
                }
                
                NavigationLink {
                    MapTypesView()
                } label: {
                    VStack(alignment: .leading) {
                        Text("Map Types")
                        Text("Standerd | Hybrid | Satellite")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                NavigationLink {
                    MapSearchMainView()
                } label: {
                    Text("Map Search by keyword")
                }

                NavigationLink {
                    MapDirectionsView()
                } label: {
                    Text("Map Route & Directions")
                }
                
                NavigationLink {
                    JSONtoMapView()
                } label: {
                    Text("JSON to Map")
                }
                
                NavigationLink {
                    MapWithUserLocationView()
                } label: {
                    Text("User's Location Tracking")
                }
            }
            .listStyle(.inset)
            .navigationTitle("Explore Map")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTest()
    }
}
