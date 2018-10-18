//
//  ViewController.swift
//  Iter
//
//  Created by Francesca Lettieri on 15/10/2018.
//  Copyright © 2018 Francesca Lettieri. All rights reserved.
//

import UIKit
import CoreLocation

struct buttonCity {
    var City:String!
    var Img:UIImage!
}

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource,  CLLocationManagerDelegate{
    var ArrayCity=[buttonCity]()
    var searchCity=[buttonCity]()
    var searching = false
    var locationManager = CLLocationManager()

    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    

    func numberOfSections(in tableView: UITableView) -> Int {
        if searching {
            return searchCity.count
        }
        else {
            return ArrayCity.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header=UIView()
        header.backgroundColor=UIColor.clear
        return header

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cells=UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CityCell")
        cells.textLabel?.text=listcity[indexPath.row]*/
        if searching {
            let cells=Bundle.main.loadNibNamed("CellsBtn", owner: self, options: nil)?.first as! CellsBtn
            cells.BtnCities.setTitle(searchCity[indexPath.section].City, for:UIControl.State.normal)
            cells.ImgBtn.image = searchCity[indexPath.section].Img
            return (cells)
        }
        else {
            let cells=Bundle.main.loadNibNamed("CellsBtn", owner: self, options: nil)?.first as! CellsBtn
            cells.BtnCities.setTitle(ArrayCity[indexPath.section].City, for:UIControl.State.normal)
            cells.ImgBtn.image = ArrayCity[indexPath.section].Img
            return (cells)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if searching {
//            return searchCity.count
//        }
//        else {
//            return ArrayCity.count
//        }
        return 1
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        navigationController?.setNavigationBarHidden(true, animated: false)
//    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        ArrayCity=[buttonCity(City: "Naples", Img:UIImage(named: "naples.jpg")),
        buttonCity(City: "Rome", Img:UIImage(named: "Rome.jpg")),
        buttonCity(City: "Florence", Img: UIImage(named: "florence.jpg")),
        buttonCity(City: "Milan", Img: UIImage(named: "milan.png")),
        buttonCity(City: "Caserta", Img: UIImage(named: "caserta.jpg")),
        buttonCity(City: "Amsterdam", Img: UIImage(named: "amsterdam.jpg"))]
        if CLLocationManager.locationServicesEnabled() {
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .notDetermined{
                
                //        Richiesta Autorizzazione
                locationManager.requestWhenInUseAuthorization()
            }
                    locationManager.desiredAccuracy = 1.0
                    locationManager.delegate = self
                    locationManager.startUpdatingLocation()
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCity = ArrayCity.compactMap{ $0 }.filter({$0.City.lowercased().prefix(searchText.count) == searchText.lowercased()})
        
            
//        searchCountry = countryNameArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        
//        filteredArray = countryAndPortsArray.flatMap{ $0 }.filter{$0.country?.lowercased().range(of: searchKey) != nil }
//
        
        searching = true
        tblView.reloadData()
    }
    
}






