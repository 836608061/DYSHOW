//
//  MineSTBtn.swift
//  newTV
//
//  Created by henghao.jiao on 16/11/22.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit

class MineSTBtn: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.mh_size = CGSizeMake(mh_width * 0.3, mh_width * 0.3)
        self.imageView?.center = CGPointMake(mh_width * 0.5, mh_height * 0.5 - 10)
        self.titleLabel?.frame = CGRectMake(0, mh_height * 0.6, mh_width, mh_height * 0.3)
        self.titleLabel?.textAlignment = .Center
    }
}
