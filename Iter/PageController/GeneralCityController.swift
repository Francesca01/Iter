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
    var texts: [String] = ["JDIJIohgfkhgfkjhgfdghjkhgfdghjkhgfdxfghjkjhgfdxdfghjhgfcxfghjgfcxfghjkhgfcghjkjhgfcghjkjuygfdghjikhgfcdxghukjhgfchjkhgfcghkjhgcfxfghjkgfcghjkhgfcxdghjkjhgfcghjkhgfcxdcfghjkhgfcdxzfghjkjhgfcxdfghjkjhgfcxdfcghjkhgvcxfcghjklhgfcdxfghjkjhgcfxdfghjkhgcfxfcghjkljhgcfxdcfghjkljhgfcxdfghjklkjhgfcghjklkjhgfdxfghjklkjhgfcxdfghkjhgfdxfghjkjhugyfdxfghkljhgfcdxfghjkljhgfdxfghjiojuhgfdgyuihygtfdsfyuiolkjhgfdxfftgyuiojhgfdfghjiolkjhgfdfghlokjhgfdghjkiljhgfdJDIJIohgfkhgfkjhgfdghjkhgfdghjkhgfdxfghjkjhgfdxdfghjhgfcxfghjgfcxfghjkhgfcghjkjhgfcghjkjuygfdghjikhgfcdxghukjhgfchjkhgfcghkjhgcfxfghjkgfcghjkhgfcxdghjkjhgfcghjkhgfcxdcfghjkhgfcdxzfghjkjhgfcxdfghjkjhgfcxdfcghjkhgvcxfcghjklhgfcdxfghjkjhgcfxdfghjkhgcfxfcghjkljhgcfxdcfghjkljhgfcxdfghjklkjhgfcghjklkjhgfdxfghjklkjhgfcxdfghkjhgfdxfghjkjhugyfdxfghkljhgfcdxfghjkljhgfdxfghjiojuhgfdgyuihygtfdsfyuiolkjhgfdxfftgyuiojhgfdfghjiolkjhgfdfghlokjhgfdghjkiljhgfd", "JIJJ", "fijfidjfie", "fjidjfijfsi"]
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
            textView.font=UIFont(name: "Helvetica", size: 20)
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
