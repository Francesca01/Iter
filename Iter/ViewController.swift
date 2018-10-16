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
    let listcity=["Rome","Florence","Milan"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(ArrayCity.count)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cells=UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CityCell")
        cells.textLabel?.text=listcity[indexPath.row]*/
        let cells=Bundle.main.loadNibNamed("CellsBtn", owner: self, options: nil)?.first as! CellsBtn
        cells.BtnCities.setTitle(ArrayCity[indexPath.row].City, for:UIControl.State.normal)
        cells.ImgBtn.image = ArrayCity[indexPath.row].Img
        return (cells)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ArrayCity=[buttonCity(City: "Rome", Img:UIImage(named: "Rome.jpg")),
        buttonCity(City: "Florence", Img: UIImage(named: "florence.jpg"))]
        
    }


}

