//
//  MapViewModel.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 15/5/23.
//

import MapKit

class MapViewModel: ObservableObject {
    var searchTerm = String() //it's another  way of creating empty String. alternative of - ""
    @Published var isBusinessViewShowing = false
    @Published private(set) var businessess = [Business]()
    @Published private(set) var selectedBusiness: Business?
    @Published private(set) var actions = [Action]()
    
    var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.6062, longitude: -122.3321), latitudinalMeters: 1600, longitudinalMeters: 1600)
    
    var selectedBusinessName: String {
        guard let selectedBusiness = selectedBusiness else { return "" }
        return selectedBusiness.name
    }
    
    var selectedBusinessPlacemark: String {
        guard let selectedBusiness = selectedBusiness else { return "??"}
        return selectedBusiness.placemark.title ?? "??"
    }
    
    func search() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTerm
        request.region = region
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response else { return }
            
            DispatchQueue.main.async {
                self.businessess = response.mapItems.map { item in
                    Business(name: item.name ?? "", placemark: item.placemark, coordinate: item.placemark.coordinate, phoneNumber: item.phoneNumber ?? "", website: item.url)
                }
            }
        }
        
        createActions()
    }
    
    func openMap(coordinate: CLLocationCoordinate2D) {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.openInMaps()
    }
    
    func setSelectedBusiness(for business: Business) {
        selectedBusiness = business
        isBusinessViewShowing.toggle()
    }
    
    func createActions() {
        actions = [
            Action(title: "Directions", image: "car.fill", handler: { [weak self] in
                guard let self = self else { return }
                self.openMap(coordinate: self.selectedBusiness!.coordinate)
            }),
            Action(title: "Call", image: "phone.fill", handler: { [weak self] in
                guard let self = self else { return }
                guard let phoneNumber = self.selectedBusiness?.phoneNumber else { return }
                guard let url = URL(string: self.convertPhoneNumberFormat(phoneNumber: phoneNumber)) else { return }
                UIApplication.shared.open(url)
            }),
            Action(title: "Website", image: "safari.fill", handler: { [weak self] in
                guard let self = self else { return }
                guard let website = self.selectedBusiness?.website else { return }
                UIApplication.shared.open(website)
            }),
        ]
    }
    
    func convertPhoneNumberFormat(phoneNumber: String) -> String {
        let strippedPhoneNumber = phoneNumber
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
        
        return "tel//\(strippedPhoneNumber)"
    }
}
