//
//  Extension.swift
//  newTV
//
//  Created by menhao on 16/9/15.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit

class Extension: NSObject {

}

extension UIColor {

static var randomColor:UIColor{
    let r = CGFloat(arc4random()%255)/255
    let g = CGFloat(arc4random()%255)/255
    let b = CGFloat(arc4random()%255)/255
    let a = CGFloat(255/255)
    return UIColor(red: r, green: g, blue: b, alpha: a)

    
    }
}