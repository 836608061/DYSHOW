//
//  MHHomeTitleBtnColleCell.swift
//  newTV
//
//  Created by henghao.jiao on 16/11/19.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit
import PureLayout
class MHHomeTitleBtnColleCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.text = "demo123"

        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.frame = CGRectMake(8, 8, mh_width - 16,mh_width - 16)
        iconImageView.layer.cornerRadius = (iconImageView.mh_width - 16) * 0.5
        iconImageView.layer.masksToBounds = true
        debugPrint(iconImageView.frame)
       
        
    }

}
