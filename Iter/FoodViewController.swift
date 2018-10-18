//
//  FoodViewController.swift
//  Iter
//
//  Created by Alex Cheung on 17/10/2018.
//  Copyright © 2018 Francesca Lettieri. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource {

    
    @IBOutlet weak var PageControl: UIPageControl!
    @IBOutlet weak var ScrollView: UIScrollView!
    var Object1=Places(Img: UIImage(named: "michele.jpeg"), Title: "Da Michele", Distance: 5)
    var Object2=Places(Img: UIImage(named: "genovesi.jpg"), Title: "Genovesi", Distance: 10)
    var Object3=Places(Img: UIImage(named: "Sorbillo.jpg"), Title: "Sorbillo", Distance: 15)
       var Object4=Places(Img: UIImage(named: "nennella.jpg"), Title: "Nennella", Distance: 20)
    var ArrayPlaces=[Places]()

    var texts: [String] = ["The renowned Neapolitan cuisine boasts ancient origins with an endless variety of dishes, based on fresh local ingredients, such as fish, mozzarella, Vesuvius tomatoes, meat, vegetables and legumes. Some dishes are among the most popular, not only in Italy, but also in the entire world: just simply think of the classic pasta with tomato and basil, or the buffalo mozzarella, or the pizza (of course), which is considered the universal symbol of Italian culinary traditions. So, here’s a list of the top 10 (+1) dishes you must absolutely try if you visit Naples. But be careful: some of them might be addictive!", "Food2", "Food3", "Food4"]
    var frame = CGRect (x:0, y:0, width:0, height:0 )
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigation bar
        navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
        loadScrollView()
        ArrayPlaces.append(Object1)
        ArrayPlaces.append(Object2)
        ArrayPlaces.append(Object3)
        ArrayPlaces.append(Object4)
        
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
            self.ScrollView.addSubview (textView)
            textView.backgroundColor=UIColor.clear
            ScrollView.backgroundColor=UIColor.clear
            textView.isEditable = false
        }
        
        ScrollView.contentSize = CGSize (width: (ScrollView.frame.size.width * CGFloat(texts.count)), height: ScrollView.frame.height)
        ScrollView.delegate = self
    }
    
    func scrollViewDidEndDecelerating(_ ScrollView: UIScrollView) {
        let pageNumber = ScrollView.contentOffset.x / ScrollView.frame.size.width
        PageControl.currentPage = Int (pageNumber)
    }
    
    
//    COLLECTION VIEW
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ArrayPlaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cells=collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCells", for: indexPath as IndexPath) as! CustomCells
        cells.Back.image=ArrayPlaces[indexPath.item].Img
        cells.TitleCard.text=ArrayPlaces[indexPath.item].Title
        cells.DescCard.text=String(ArrayPlaces[indexPath.item].Distance)+"KM"
        return cells
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
