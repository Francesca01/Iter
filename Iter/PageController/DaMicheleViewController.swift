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

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}

class DaMicheleViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
 

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var PhotoPlaces: UIImageView!
    @IBOutlet weak var InfoLbl: UITextView!
    var locationManager = CLLocationManager()
    var places:Places?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title=places?.Title
        PhotoPlaces.image=places?.Img
        InfoLbl.text=places?.Info
        mapView.showsUserLocation = true
        
        if CLLocationManager.locationServicesEnabled() {
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .notDetermined{
                
                //        Richiesta Autorizzazione
                locationManager.requestWhenInUseAuthorization()
            }
            locationManager.desiredAccuracy = 1.0
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
             let destinationLocation = CLLocationCoordinate2D(latitude:38.643172 , longitude: -90.177429)
            
            let loc = locationManager.location
            locationManager.startUpdatingLocation()

            let sourceLocation: CLLocationCoordinate2D = (loc?.coordinate ?? CLLocationCoordinate2D (latitude:39.173209 , longitude: -94.593933))
           
            let sourcePin = customPin(pinTitle: "Your location", pinSubTitle: "", location: sourceLocation)
            let destinationPin = customPin(pinTitle: places?.Title ?? "Destination", pinSubTitle: "", location: destinationLocation)
            self.mapView.addAnnotation(sourcePin)
            self.mapView.addAnnotation(destinationPin)
            
            let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation)
            let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation)
            
            let directionRequest = MKDirections.Request()
            directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
            directionRequest.destination = MKMapItem(placemark: destinationPlaceMark)
            directionRequest.transportType = .automobile
            
            let directions = MKDirections(request: directionRequest)
            directions.calculate { (response, error) in
                guard let directionResonse = response else {
                    if let error = error {
                        print("we have error getting directions==\(error.localizedDescription)")
                    }
                    return
                }
                
                let route = directionResonse.routes[0]
                self.mapView.addOverlay(route.polyline, level: .aboveRoads)
                
                let rect = route.polyline.boundingMapRect
                self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            }
            
            self.mapView.delegate = self
            
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
    
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }
    
}
