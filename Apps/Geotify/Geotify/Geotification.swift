//
//  Geotification.swift
//  Geotify
//
//  Created by Joel Hollingsworth on 10/9/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import CoreLocation
import MapKit

class Geotification: NSObject, MKAnnotation {
    
    enum EventType: String {
        case onEntry = "On Entry"
        case onExit = "On Exit"
    }
    
    var coordinate: CLLocationCoordinate2D
    var radius: CLLocationDistance
    var note: String
    var eventType: EventType
    
    var title: String? {
        if note.isEmpty {
            return "No Note"
        } else {
            return note
        }
    }
    
    init(coordinate: CLLocationCoordinate2D, radius: CLLocationDistance, note: String, eventType: EventType) {
        self.coordinate = coordinate
        self.radius = radius
        self.note = note
        self.eventType = eventType
    }
    
}






