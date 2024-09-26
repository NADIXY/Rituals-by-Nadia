//
//  MapView.swift
//  Rituals
//
//  Created by Nadia on 24.09.24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        NavigationStack {
            Map(position: $locationManager.camera) {
                ForEach(locationManager.locations) { location in
                    Annotation(location.title, coordinate: location.coordinate) {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundStyle(.yellow)
                    }
                }
                
                //            UserAnnotation()
                
                if let route = locationManager.route {
                    MapPolyline(route.polyline)
                        .stroke(.green, lineWidth: 10)
                }
            }
            .safeAreaInset(edge: .bottom) {
                HStack {
                    TextField("Nach einem Ort suchen",
                              text: $locationManager.query)
                    .textFieldStyle(.roundedBorder)
                    
                    Button {
                        locationManager.getLocation()
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
            .onAppear {
                locationManager.requestLocation()
                //            locationManager.fetchFromRoute(CLLocationCoordinate2D.berlinerHBF,
                //                                           CLLocationCoordinate2D.berlinerMall)
            }
            .overlay {
                if locationManager.loading {
                    ProgressView()
                }
            }
            .opacity(locationManager.loading ? 0.3 : 1.0)
        }
        .navigationTitle("Maps")
    }
}

#Preview {
    MapView()
}
