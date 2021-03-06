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
    var Object1=Places(Img: UIImage(named: "michele.jpeg"), Title: "Da Michele", Distance: 5,Info:"The shabby naples joint of L’antica Pizzeria da Michele, open since 1906, is muchhyped as the best pizza in the world. Fanning the flames of that rep was the 2010 film Eat Pray Love, where Julia Roberts sits all blissed out, declaring shes having a relationship with her pizza.")
    var Object2=Places(Img: UIImage(named: "genovesi.jpg"), Title: "Genovesi", Distance: 10, Info: "The pizzeria of Gaetano Genovesi derives its traditional origins from its own family. Antonio Genovesi, has starded the activity of pizza and was much appreciated by the Neapolitans and beyond. Antonio, was one of the first in Naples to make Neapolitan pizza known in the eastern countries especially in Japan in 1969, where he won awards and exported the Neapolitan culinary tradition.")
    var Object3=Places(Img: UIImage(named: "Sorbillo.jpg"), Title: "Sorbillo", Distance: 15, Info: "Gino Sorbillo belongs to one of the oldest families of pizza makers in Naples. His grandparents, Luigi Sorbillo and Carolina Esposito, founded the first pizzeria in 1935 on Via dei Tribunali, defined by many as the Via della Pizza Napoletana in the old city center.")
    var Object4=Places(Img: UIImage(named: "nennella.jpg"), Title: "Nennella", Distance: 20, Info: "We are the ideal restaurant to organize group lunches, banquets, birthday parties or small parties, our traditional cuisine makes fall in love all our guests, full of Mediterranean flavors and flavors always presented in their maximum freshness.")
    var ArrayPlaces=[Places]()

    var texts: [String] = ["The renowned Neapolitan cuisine boasts ancient origins with an endless variety of dishes, based on fresh local ingredients, such as fish, mozzarella, Vesuvius tomatoes, meat, vegetables and legumes.\n \nSome dishes are among the most popular, not only in Italy, but also in the entire world: just simply think of the classic pasta with tomato and basil, or the buffalo mozzarella, or the pizza (of course), which is considered the universal symbol of Italian culinary traditions.", "Pizza\n \nWhile the world pizza-making championships being held at the Napoli Pizza Village festival this week (1-10 June) will see the finest pizzaioli from across the city compete for the 2018 title, Neapolitans will attest there are pizzerias in every neighbourhood worthy of an accolade. There are more than 800 pizzerias in the birthplace of pizza, but only 100 can boast certification by the Associazione Verace Pizza Napoletana (AVPN), the regulatory body that protects and ensures that the art of pizza-making and the ingredients used are in accordance with Neapolitan tradition.\n \nWhile the most logical way to spot a good pizzeria in Naples is to look out for Pizza Vera signs issued by the AVPN above restaurant doors, the real indication of good pizza is the queue on the street outside. If there aren’t ravenous-looking Neapolitans waiting outside the neighbourhood pizzeria, then there is reason to suggest the pizza hasn’t garnered the collective approval of the locals.", "Sfogliatella\n \nTry the two types of sfogliatella: Riccia and Frolla. You which side you're on! The best ones are Pintauro's, Scaturchio's and from Mary's, who is under the Umberto I Gallery. Most people say, however, that the best Neapolitan sfogliatella Attanasio's with no doubts.", "Frittura Napoletana\n \nThe typical Neapolitan fry: zeppole, panzarotti, rice balls, fried and golden aubergines, scaglizzi (pieces of fried polenta), seaweed fritters, pumpkin flowers (the \"ciurilli\") and all that that you can find. The best places to taste Neapolitan fry are the 'Friggitoria Vomero' and the renowned 'Pizzeria Di Matteo'."]
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
            
            
            
            //changing the property text font
            
//            ScrollView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
//
//            textView.backgroundColor = UIColor.clear
            textView.backgroundColor=UIColor.clear
            ScrollView.backgroundColor=UIColor.clear
            textView.isEditable = false
            
            textView.font = UIFont(name: "Helvetica", size:20)
            textView.textColor = UIColor.black
            //textView.textAlignment = .justified
            //textView.contentInset = UIEdgeInsets.init(top: 10, left: 5,bottom: 5,right: 10)
            
            //textView.tintColor = UIColor.black
            ScrollView.layer.cornerRadius = 10.0
        
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let places=ArrayPlaces[indexPath.row]
        performSegue(withIdentifier: "ShowPlaces", sender: places)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="ShowPlaces"
        {
            let destVC = segue.destination as! DaMicheleViewController
            destVC.places=sender as? Places
        }
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
