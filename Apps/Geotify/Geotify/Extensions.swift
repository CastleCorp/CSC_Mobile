//
//  Extensions.swift
//  Geotify
//
//  Created by Parker Thomas on 10/4/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import MapKit

extension MKMapView {
    func zoomToUserLocation() {
        guard let coordinate = userLocation.location?.coordinate else {
            print("zoom: no location")
            return
        }
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 10000, 10000)
        setRegion(region, animated: true)
    }
}
