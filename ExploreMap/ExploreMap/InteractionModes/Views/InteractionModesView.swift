//
//  InteractionModesView.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 17/5/23.
//

import SwiftUI

struct InteractionModesView: View {
    var body: some View {
        List {
            NavigationLink {
                MapInteractionExampleView(interaction: .all)
            } label: {
                Text("Default Interaction")
            }
            
            NavigationLink {
                MapInteractionExampleView(interaction: .onlyPan)
            } label: {
                Text("Only Pan")
            }
            
            NavigationLink {
                MapInteractionExampleView(interaction: .onlyZoom)
            } label: {
                Text("Only Zoom")
            }
            
            NavigationLink {
                MapInteractionExampleView(interaction: .nothing)
            } label: {
                Text("No Interaction")
            }
        }
        .navigationTitle("Interaction Modes")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InteractionModesView_Previews: PreviewProvider {
    static var previews: some View {
        InteractionModesView()
    }
}
