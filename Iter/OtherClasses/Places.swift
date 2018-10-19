//
//  Places.swift
//  Iter
//
//  Created by Francesco Stabile on 18/10/2018.
//  Copyright © 2018 Francesca Lettieri. All rights reserved.
//

import UIKit

class Places: NSObject {
    var Img:UIImage!
    var Title:String!
    var Distance:Float!
    var Info:String!
    init(Img:UIImage!,Title:String!,Distance:Float!,Info:String) {
        self.Img=Img
        self.Title=Title
        self.Distance=Distance
        self.Info=Info
    }
    

}
