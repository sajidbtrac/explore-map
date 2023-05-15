//
//  BusinessView.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 15/5/23.
//

import SwiftUI

struct BusinessView: View {
    @ObservedObject var mapController: MapViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(mapController.selectedBusinessName)
                        .font(.title)
                    
                    Text(mapController.selectedBusinessPlacemark)
                }
                .padding()
                
                Spacer()
                
                Button {
                    mapController.isBusinessViewShowing.toggle()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
            
            VStack {
                ForEach(mapController.actions) { action in
                    Button {
                        action.handler()
                    } label: {
                        VStack {
                            Image(systemName: action.image)
                            Text(action.title)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
        .padding()
        
        Spacer()
    }
}

struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessView(mapController: MapViewModel())
            .previewLayout(.sizeThatFits)
    }
}
