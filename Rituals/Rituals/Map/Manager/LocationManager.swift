//
//  LocationManager.swift
//  Rituals
//
//  Created by Nadia on 26.09.24.
//

import Foundation
/*import CoreLocation
import _MapKit_SwiftUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    @Published var camera: MapCameraPosition = .automatic
    @Published var locations = Location.locations

    @Published var route: MKRoute?
    @Published var query = ""

    @Published var loading = false
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            camera = MapCameraPosition.camera(
                MapCamera(centerCoordinate: .init(latitude: location.coordinate.latitude,
                                                                                longitude: location.coordinate.longitude),
                                                        distance: 1000)
            )
        }
    }
    
    @MainActor
    func fetchFromRoute(_ source: CLLocationCoordinate2D, _ destination: CLLocationCoordinate2D) {
        Task {
            loading = true
            
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: source))
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
            request.transportType = .automobile
            
            let result = try? await MKDirections(request: request).calculate()
            
            guard let result = result?.routes.first else { return }
            
            route = result
            loading = false
        }
    }
    
    @MainActor
    func getLocation() {
        Task {
            loading = true
            let searchRequest = MKLocalSearch.Request()
            searchRequest.naturalLanguageQuery = query
            
            let request = MKLocalSearch(request: searchRequest)
            
            let result = try? await request.start()
            
            guard let result = result, let item = result.mapItems.first else { return }
            
            camera = MapCameraPosition.camera(
                MapCamera(centerCoordinate: .init(latitude: item.placemark.coordinate.latitude,
                                                  longitude: item.placemark.coordinate.longitude),
                                                        distance: 1000)
            )
            locations.append(Location(title: query, coordinate: .init(latitude: item.placemark.coordinate.latitude,
                                                                      longitude: item.placemark.coordinate.longitude)))
            loading = false
        }
    }
}*/
