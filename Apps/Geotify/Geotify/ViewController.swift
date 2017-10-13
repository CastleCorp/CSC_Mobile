//
//  ViewController.swift
//  Geotify
//
//  Created by Joel Hollingsworth on 10/2/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManger.delegate = self
        locationManger.requestAlwaysAuthorization()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addGeotification" {
            let navigationController  = segue.destination as! UINavigationController
            let vc = navigationController.viewControllers.first as! AddGeotificationViewController
            
            vc.viewController = self
            
        }
    }
    
    func addGeotification(_ coordinate: CLLocationCoordinate2D, _ radius: CLLocationDistance, _ note: String, _ eventType: Geotification.EventType) {
        print(radius)
        print(note)
        print(eventType)
        print(coordinate)
    }

    @IBAction func zoomToCurrentLocation(_ sender: UIBarButtonItem) {
        mapView.zoomToUserLocation()
    }

}

