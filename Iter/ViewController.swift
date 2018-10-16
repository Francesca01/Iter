//
//  ViewController.swift
//  Iter
//
//  Created by Francesca Lettieri on 15/10/2018.
//  Copyright © 2018 Francesca Lettieri. All rights reserved.
//

import UIKit

struct buttonCity {
    var City:String!
    var Img:UIImage!
}
class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{
    var ArrayCity=[buttonCity]()
    var searchCity=[buttonCity]()
    let listcity=["Rome","Florence","Milan"]
    var searching = false
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return(ArrayCity.count)
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cells=UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CityCell")
        cells.textLabel?.text=listcity[indexPath.row]*/
        if searching {
            let cells=Bundle.main.loadNibNamed("CellsBtn", owner: self, options: nil)?.first as! CellsBtn
            cells.BtnCities.setTitle(searchCity[indexPath.row].City, for:UIControl.State.normal)
            cells.ImgBtn.image = searchCity[indexPath.row].Img
            return (cells)
        }
        else {
            let cells=Bundle.main.loadNibNamed("CellsBtn", owner: self, options: nil)?.first as! CellsBtn
            cells.BtnCities.setTitle(ArrayCity[indexPath.row].City, for:UIControl.State.normal)
            cells.ImgBtn.image = ArrayCity[indexPath.row].Img
            return (cells)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchCity.count
        }
        else {
            return ArrayCity.count
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ArrayCity=[buttonCity(City: "Rome", Img:UIImage(named: "Rome.jpg")),
        buttonCity(City: "Florence", Img: UIImage(named: "florence.jpg"))]
        
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





