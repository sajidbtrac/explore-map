//
//  MapSearchMainView.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 15/5/23.
//

import SwiftUI

struct MapSearchMainView: View {
    @StateObject var mapController = MapViewModel()

    var body: some View {
        NavigationView {
            MapViewTest(mapController: mapController)
        }
        .searchable(text: $mapController.searchTerm)
        .onSubmit(of: .search) {
            mapController.search()
        }
    }
}

struct MapSearchMainView_Previews: PreviewProvider {
    static var previews: some View {
        MapSearchMainView()
    }
}
