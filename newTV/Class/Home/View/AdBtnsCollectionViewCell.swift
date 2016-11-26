//
//  AdBtnsCollectionViewCell.swift
//  newTV
//
//  Created by menhao on 16/9/16.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit

class AdBtnsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        imageV.layer.cornerRadius = 25
        imageV.clipsToBounds = true

        
          }

}
