//
//  LocationsData.swift
//  Test
//
//  Created by Oliver Pavlovsky on 21/07/2022.
//

import Foundation
import MapKit
import SwiftUI

struct Locations: Codable,Identifiable {
    
    var id=UUID()
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}



let locationsData: [Locations] = [
Locations(name: "Orava Castle",image:"orava-castle" , latitude: 49.26197031260796 ,longitude: 19.358570898268713),
Locations(name: "Vlkolinec",image:"vlkolinec", latitude: 49.039337378021266 ,longitude: 19.27788248186954),
Locations(name: "Bardejov",image:"bardejov", latitude: 49.29698241279072 ,longitude: 21.267720746775606),
Locations(name: "Kosice",image:"kosice", latitude: 48.734437524442505 ,longitude: 21.252684750914373),
Locations(name: "Levoca",image:"levoca", latitude: 49.01869758787214 ,longitude: 20.58857236026092),
Locations(name: "Spis Castle",image:"spis-castle", latitude: 48.99949893459144 ,longitude: 20.767500969403113),
Locations(name: "Banska Stiavnica",image:"banska-stiavnica", latitude: 48.449130022693495 ,longitude: 18.906370793045255),
Locations(name: "Slovak National Paradise Park",image:"slovak-paradise", latitude: 48.90821690501649 ,longitude: 20.386344143166077),
Locations(name: "High Tatras",image:"high-tatras", latitude: 49.166744069524405 ,longitude: 20.131881061787663),
Locations(name: "Bratislava",image:"bratislava", latitude: 48.153059652844696 ,longitude: 17.10538748028737)
]

