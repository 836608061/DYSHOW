
//
//  MHHomeTitleBtnsView.swift
//  newTV
//
//  Created by henghao.jiao on 16/11/19.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit
private let ID = "cell"
class MHHomeTitleBtnsView: UICollectionReusableView,UICollectionViewDelegate,UICollectionViewDataSource{
    let pageContorl = UIPageControl()
    let scroView = UIScrollView()
    override func layoutSubviews() {
        super.layoutSubviews()
        scroView.frame = bounds
        scroView.contentSize = CGSizeMake(self.mh_width * 2, self.mh_height)
        addSubview(scroView)
        scroView.bounces = false
        scroView.pagingEnabled = true
//     后期替换有粘性的pageContorl
        pageContorl.mh_size = CGSizeMake(40, 20)
        pageContorl.center = CGPointMake(mh_width * 0.5, mh_height - 10)
        pageContorl.currentPage = 1
        pageContorl.numberOfPages = 2
        pageContorl.currentPageIndicatorTintColor = UIColor.orangeColor()
        pageContorl.pageIndicatorTintColor = UIColor.darkGrayColor()
        addSubview(pageContorl)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(screenW * 0.25 ,mh_height * 0.5)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        
        let collectionV = UICollectionView(frame: bounds, collectionViewLayout: layout)
        scroView.addSubview(collectionV)
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.registerNib(UINib.init(nibName: "MHHomeTitleBtnColleCell", bundle: nil), forCellWithReuseIdentifier: ID)
       
        
        let collectionV1 = UICollectionView(frame: CGRectMake(mh_width, 0, mh_width, mh_height), collectionViewLayout: layout)
        scroView.addSubview(collectionV1)
        collectionV1.delegate = self
        collectionV1.dataSource = self
        collectionV1.registerNib(UINib.init(nibName: "MHHomeTitleBtnColleCell", bundle: nil), forCellWithReuseIdentifier: ID)
        
     

    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 8
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ID, forIndexPath: indexPath) as!MHHomeTitleBtnColleCell
        cell.backgroundColor = UIColor.redColor()
        
        return cell
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
