//
//  HMHomePageGameConllectionCell.swift
//  newTV
//
//  Created by henghao.jiao on 16/11/18.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit
import SDWebImage
class HMHomePageGameConllectionCell: UICollectionViewCell {
    
    
    
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var mhDataSource : HMHomeGameModel?{
        
        
        didSet{
            
            guard iconImageView != nil else{return}
            guard titleLabel != nil else{return}
            guard  let  iconurl = mhDataSource?.icon_url else {return}
            
            iconImageView.sd_setImageWithURL(NSURL(string:iconurl ))
            
            titleLabel.text = mhDataSource?.tag_name
        }
        
        
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    
    }

}
