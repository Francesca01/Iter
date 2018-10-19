//
//  CultureViewController.swift
//  Iter
//
//  Created by Francesca Lettieri on 18/10/2018.
//  Copyright © 2018 Francesca Lettieri. All rights reserved.
//

import UIKit

class CultureViewController: UIViewController, UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
 
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var PageControl: UIPageControl!
    
    var Object1=Places(Img: UIImage(named: "piazzaPleb.jpeg"), Title: "Piazza del Plebiscito", Distance: 5, Info: "A")
    var Object2=Places(Img: UIImage(named: "palazzoReale.jpg"), Title: "Palazzo Reale", Distance: 10, Info: "a")
    var Object3=Places(Img: UIImage(named: "chiesaGesu.jpg"), Title: "Chiesa del Gesù Nuovo", Distance: 15, Info: "A")
    var Object4=Places(Img: UIImage(named: "museoCapodimonte.jpg"), Title: "Museo di Capodimonte", Distance: 20, Info: "a")
    var arrayPlaces=[Places]()
    
    var texts: [String] = ["Hi traveler, welcome to Naples. To know everything you can do or you can not, please swipe left. You will receive some tips to better integrate yourself in the local culture of this magnificent city.", "Place2", "Place3", "Place4"]
    var frame = CGRect (x:0, y:0, width:0, height:0 )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //navigation bar
        navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
        loadScrollView()
        arrayPlaces.append(Object1)
        arrayPlaces.append(Object2)
        arrayPlaces.append(Object3)
        arrayPlaces.append(Object4)
    }
    
    
    func loadScrollView() {
        ScrollView.delegate = self
        ScrollView.contentSize = CGSize(width: (ScrollView.frame.size.width * CGFloat(texts.count)), height: ScrollView.frame.size.height)
        
        PageControl.numberOfPages = texts.count
        
        
        for i in 0..<texts.count{
            
            //            let textView = UILabel(frame: CGRect(x:
            //                self.ScrollView.frame.size.width * CGFloat(i), y: 0, width:  30 , height: 30))
            //            textView.text = texts[i]
            //            textView.numberOfLines = 0
            //            textView.textColor = UIColor.white
            //            textView.textAlignment = .center
            //            self.ScrollView.addSubview(textView)
            
            frame.origin.x = ScrollView.frame.size.width * CGFloat(i)
            frame.size = ScrollView.frame.size
            let textView = UITextView (frame: frame)
            textView.text = texts[i]
            textView.font=UIFont(name: "Helvetica", size: 20)
            self.ScrollView.addSubview (textView)
            textView.backgroundColor=UIColor.clear
            ScrollView.backgroundColor=UIColor.clear
            textView.isEditable = false
        }
    
//        SCROLL VIEW
    ScrollView.contentSize = CGSize (width: (ScrollView.frame.size.width * CGFloat(texts.count)), height: ScrollView.frame.height)
        ScrollView.delegate = self
    }
    
    func scrollViewDidEndDecelerating(_ ScrollView: UIScrollView) {
        let pageNumber = ScrollView.contentOffset.x / ScrollView.frame.size.width
        PageControl.currentPage = Int (pageNumber)
    }
    
    
//        COLLECTION VIEW
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayPlaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cells=collectionView.dequeueReusableCell(withReuseIdentifier: "PlacesCells", for: indexPath as IndexPath) as! CustomCells
        cells.Back.image=arrayPlaces[indexPath.item].Img
        cells.TitleCard.text=arrayPlaces[indexPath.item].Title
        cells.DescCard.text=String(arrayPlaces[indexPath.item].Distance)+"KM"
        return cells
    }
    
}
