//
//  GoogleMapsView.swift
//  Test
//
//  Created by Oliver Pavlovsky on 19/08/2022.
//

import SwiftUI
import GoogleMaps

struct GoogleMapsView: UIViewRepresentable {
    let cities: [Locations]

    func makeUIView(context: Self.Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 48.6737532, longitude: 19.696058, zoom: 6.5)
        let googleMapsView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        return googleMapsView
    }

    func updateUIView(_ googleMapsView: GMSMapView, context: Self.Context) {
        for city in cities {
            let marker : GMSMarker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: city.latitude , longitude: city.longitude )
            marker.title = city.name
            marker.snippet = "There is \(city.name )"
            marker.map = googleMapsView
        }
    }
}
    
    
    /*
    let mapPlaces: [Locations]
     
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.slovakia
        
        let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
        
        
        
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        
        for place in mapPlaces {
            let marker: GMSMarker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: place.latitude , longitude: place.longitude )
            marker.title = place.name
            marker.snippet = "Welcome to \(place.name )"
            marker.map = GoogleMapsView
        }
        
    }
    
    
    
 }
extension GMSCameraPosition  {
    static var slovakia = GMSCameraPosition.camera(withLatitude: 48.6737532, longitude: 19.696058, zoom: 6.5)
 }
*/
