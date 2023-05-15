//
//  MapNaviagtionMainView.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 15/5/23.
//

import SwiftUI

struct MapNaviagtionMainView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Map Navigation")
                    .padding()
                
                NavigationLink(destination: MapContentView()) {
                    Text("Begin")
                }
                .padding()
            }
        }
    }
}

struct MapNaviagtionMainView_Previews: PreviewProvider {
    static var previews: some View {
        MapNaviagtionMainView()
    }
}
