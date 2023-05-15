//
//  ContentView.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 15/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    MapSearchMainView()
                } label: {
                    Text("Map Search")
                }

                NavigationLink {
                    MapNaviagtionMainView()
                } label: {
                    Text("Map Naviagtion")
                }
            }
            .listStyle(.inset)
            .navigationTitle("Explore Map")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
