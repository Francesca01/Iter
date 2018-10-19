//
//  GeneralCityController.swift
//  Iter
//
//  Created by Francesco Stabile on 17/10/2018.
//  Copyright © 2018 Francesca Lettieri. All rights reserved.
//

import UIKit
import FaveButton

class GeneralCityController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var heartButton: FaveButton!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var PageControl: UIPageControl!
    var texts: [String] = ["Naples, also known as Napoli in Italian, is one of the most iconic cities in Italy and one of the most popular destinations in the entire Mediterranean region. Its history spans back nearly 3,000 years to the ancient Greeks who founded the Naples area during the 8th century BC. Since then, this southern Italian city has gone through countless transformations and has been under the rule of the Roman Empire, the Barbarians, Spain, and Austria, to name a few. The city is currently home to nearly a million residents with several million more living in the surrounding districts.", "Naples comes from the Greek word Neapolis which means “new city” or “new town”. It was originally given this name by its early Greek inhabitants in the 8th century BC.", "Naples is situated near the Gulf of Naples, or the Bay of Naples, which is home to several reefs, species of tuna, amberjacks, and tiny spotted sharks.", "In 1995, the historic city centre was designated a UNESCO World Heritage Site.", "Castel dell’Ovo is translated roughly to Egg Castle and is linked to a legend involving a magic egg that contained protective powers. This egg is said to have been buried in a secret location within the castle.", "Naples is divided into several districts or zones that are named after their locations or featured attributes.", "Naples is the capital of the Campania region which comes from the aptly named Campania Felix, the latin term for “fertile countryside”."]
    var frame = CGRect (x:0, y:0, width:0, height:0 )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
        loadScrollView()
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
            textView.isEditable = false
            
        }
        
        ScrollView.contentSize = CGSize (width: (ScrollView.frame.size.width * CGFloat(texts.count)), height: ScrollView.frame.height)
        ScrollView.delegate = self
    }

    func scrollViewDidEndDecelerating(_ ScrollView: UIScrollView) {
        let pageNumber = ScrollView.contentOffset.x / ScrollView.frame.size.width
        PageControl.currentPage = Int (pageNumber)
    }

}
