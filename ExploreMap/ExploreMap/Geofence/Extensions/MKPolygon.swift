//
//  MKPolygon.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 16/5/23.
//

#if canImport(Foundation)
    import Foundation
#endif
#if canImport(SwiftUI)
    import SwiftUI
#endif
#if canImport(MapKit)
    import MapKit
#endif
#if canImport(CoreGraphics)
    import CoreGraphics
#endif

extension MKPolygon {
    func containsCoor(coor: CLLocationCoordinate2D) -> Bool {
        let polygonRenderer = MKPolygonRenderer(polygon: self)
        let currentMapPoint: MKMapPoint = MKMapPoint(coor)
        let polygonViewPoint: CGPoint = polygonRenderer.point(for: currentMapPoint)
        if polygonRenderer.path == nil {
          return false
        }else{
          return polygonRenderer.path.contains(polygonViewPoint)
        }
    }
}


