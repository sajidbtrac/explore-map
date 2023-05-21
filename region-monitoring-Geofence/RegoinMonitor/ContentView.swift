//
//  ContentView.swift
//  RegoinMonitor
//
//  Created by Sachinthana Aluvihare on 11/12/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @EnvironmentObject var settings: AlertSettings
    
    @StateObject private var locationManager = LocationManager()
    
    var region: Binding<MKCoordinateRegion>? {
        guard let location = locationManager.location else {
            return MKCoordinateRegion.goldenGetRegion().getBinding()
        }
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
        
        return region.getBinding()
    }

    var body: some View {
        ZStack {
            if let region = region {
                Map(coordinateRegion: region, interactionModes: .all, showsUserLocation: true, userTrackingMode: .constant(.follow)) // map updates by following the user's location
            }
            
            Text("User at destination: \(settings.showAlert ? "Yes" : "No")")
                .padding()
                .background(settings.showAlert ? Color.green : Color.red)
                .cornerRadius(10)
                .offset(y: 300)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AlertSettings())
    }
}
