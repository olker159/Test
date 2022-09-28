//
//  PlaceDetailView.swift
//  Test
//
//  Created by Oliver Pavlovsky on 19/07/2022.
//

import SwiftUI
import MapKit
import GoogleMaps
import UIKit

struct LocationsView: View {
    
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 48.6737532 , longitude: 19.696058)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 6.0, longitudeDelta: 6.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    @State var items = ["Satellite", "Standad"]
    @State var mapType: MKMapType = .hybrid
    
    let locations: [Locations] = locationsData
    
    
    var body: some View {
        

        NavigationView{
        //Map(coordinateRegion: $region)
        
        Map(coordinateRegion: $region, annotationItems: locations,
            annotationContent: { item in
            
            
            MapAnnotation(coordinate: item.location) {
                Image("marker-2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30 , height: 30, alignment: .center)
            }
        })

        }
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Text("Top 10 places locations")
                
            }
                .padding(.vertical,12)
                .padding(.horizontal,16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
            , alignment: .top
            
        )
        }
    }



struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}

/*
 import SwiftUI
 import MapKit
 
 struct MapViewUIKit: UIViewRepresentable {
 // 1.
 let region: MKCoordinateRegion
 let mapType : MKMapType
 
 // 2.
 func makeUIView(context: Context) -> MKMapView {
 let mapView = MKMapView()
 mapView.setRegion(region, animated: false)
 mapView.mapType = mapType
 return mapView
 }
 
 // 3.
 func updateUIView(_ mapView: MKMapView, context: Context) {
 mapView.mapType = mapType
 }
 }
 
 
 struct ContentView: View {
 // 1
 @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.61900, longitude: -74.14053) , span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
 // 2
 @State private var mapType: MKMapType = .standard
 
 var body: some View {
 ZStack {
 // 3
 MapViewUIKit(region: region, mapType: mapType)
 .edgesIgnoringSafeArea(.all)
 
 VStack {
 Spacer()
 // 4
 Picker("", selection: $mapType) {
 Text("Standard").tag(MKMapType.standard)
 Text("Satellite").tag(MKMapType.satellite)
 Text("Hybrid").tag(MKMapType.hybrid)
 }
 .pickerStyle(SegmentedPickerStyle())
 .offset(y: -40)
 .font(.largeTitle)
 }
 }
 }
 }
 */

