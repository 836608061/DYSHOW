//
//  MainCollectionViewCell.swift
//  newTV
//
//  Created by kkkmr on 16/9/11.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit
import SDWebImage

class MainCollectionViewCell: UICollectionViewCell {
//let screenW = UIScreen.mainScreen().bounds.width
    @IBOutlet weak var imageView: UIImageView!
    var mhDataSource : HMHomeGameModel?{
        
        
        didSet{
            
            guard imageView != nil else{return}
//            guard titleLabel != nil else{return}
            guard  let  iconurl = mhDataSource?.icon_url else {return}
            
            imageView.sd_setImageWithURL(NSURL(string:iconurl ), placeholderImage: UIImage(named:"点赞按钮_36x36_")) { (image, err, _, _) in
                let corner =  self.imageView.bounds.width / 15
                UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, false, 0.0)
                UIBezierPath(roundedRect: self.imageView.bounds, cornerRadius: corner).addClip()
                image.drawInRect(self.imageView.bounds)
                self.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
              
                
            }
            
//            titleLabel.text = mhDataSource?.tag_name
        }
        
        
        
        
    }
    override func awakeFromNib() {

        
        //        给圆角
         let corner =  self.imageView.bounds.width / 15
        UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, false, 0.0)
         UIBezierPath(roundedRect: self.imageView.bounds, cornerRadius: corner).addClip()
        self.imageView.drawRect(self.imageView.bounds)
        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        super.awakeFromNib()
        //        去像素化
        
    }

}
