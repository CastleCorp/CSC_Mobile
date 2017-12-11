//
//  AddGeotificationViewController.swift
//  Geotify
//
//  Created by Joel Hollingsworth on 10/2/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class AddGeotificationViewController: UIViewController {
        
    @IBOutlet weak var entryOrExit: UISegmentedControl!
    @IBOutlet weak var radius: UITextField!
    @IBOutlet weak var note: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var viewController: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
    }
    
    @IBAction func onCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func addNewGeotification(_ sender: UIButton) {
        let radiusValue = Double(radius.text!) ?? 100
        let noteValue = note.text!
        let eventType: Geotification.EventType = entryOrExit.selectedSegmentIndex == 0 ? .onEntry : .onExit
        let coordinate = mapView.centerCoordinate
        
        viewController?.addGeotification(coordinate, radiusValue, noteValue, eventType)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func zoomToCurrentLocation(_ sender: UIBarButtonItem) {
        mapView.zoomToUserLocation()
    }
}
