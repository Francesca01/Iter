//
//  DaMicheleViewController.swift
//  Iter
//
//  Created by Francesca Lettieri on 18/10/2018.
//  Copyright © 2018 Francesca Lettieri. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DaMicheleViewController: UIViewController, CLLocationManagerDelegate {
 

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var PhotoPlaces: UIImageView!
    var locationManager = CLLocationManager()
    var places:Places?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title=places?.Title
        PhotoPlaces.image=places?.Img
        mapView.showsUserLocation = true
        
        if CLLocationManager.locationServicesEnabled() {
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .notDetermined{
                
                //        Richiesta Autorizzazione
                locationManager.requestWhenInUseAuthorization()
            }
            locationManager.desiredAccuracy = 1.0
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
        else {
            //          Qui potremmo mostrare un alert!!!
            print("Please, turn on location services or GPS")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04))
        self.mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print ("Unable to  access your current location!")
    }
    
}
