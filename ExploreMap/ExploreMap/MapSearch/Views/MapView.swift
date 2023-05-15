//
//  MapView.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 15/5/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var mapController: MapViewModel
    
    var body: some View {
        Map(coordinateRegion: $mapController.region, annotationItems: mapController.businessess) { business in
            MapAnnotation(coordinate: business.coordinate) {
                Image(systemName: "mappin.and.ellipse")
                    .font(.title)
                    .foregroundColor(.pink)
                    .onTapGesture {
                        mapController.setSelectedBusiness(for: business)
                    }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .sheet(isPresented: $mapController.isBusinessViewShowing) {
            BusinessView(mapController: mapController)
//                .presentationDents([.fraction[0.27], .large]) //eta iOS 16 theke available. Bottom Sheet
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(mapController: MapViewModel())
    }
}
