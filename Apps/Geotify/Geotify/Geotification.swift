//
//  Geotification.swift
//  Geotify
//
//  Created by Joel Hollingsworth on 10/9/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import CoreLocation

class Geotification {
    
    enum EventType: String {
        case onEntry = "On Entry"
        case onExit = "On Exit"
    }
    
    var coordinate: CLLocationCoordinate2D
    var radius: CLLocationDistance
    var note: String
    var eventType: EventType
    
    init(coordinate: CLLocationCoordinate2D, radius: CLLocationDistance, note: String, eventType: EventType) {
        self.coordinate = coordinate
        self.radius = radius
        self.note = note
        self.eventType = eventType
    }
    
}






