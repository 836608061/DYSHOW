//
//  MHBaseCollectionViewController.swift
//  newTV
//
//  Created by kkkmr on 16/9/11.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit
var titleCollectionViewHeight = (screenH - CGFloat(navigationbarHeight  + tabBarHeight)) * 0.5
private let reuseIdentifier = "Cell"
//private let ReusableID = "ReusableID"
private let ReusableID = "ReusableID"
class MHBaseCollectionViewController: UICollectionViewController {

    init(){
        let layout = UICollectionViewFlowLayout()
        
        let spaceWidthOnIphone6 = 18
        let  itemWidth = (screenW - CGFloat(spaceNum) * CGFloat(spaceWidthOnIphone6))/2
        let itemHeight = (screenH - CGFloat(navigationbarHeight  + tabBarHeight))/4
        layout.sectionInset = UIEdgeInsetsMake(0, 18, 0, 18)
        layout.minimumInteritemSpacing = 1.0
        layout.minimumLineSpacing = 1.0
        layout.itemSize = CGSizeMake(itemWidth, itemHeight)
        
        
    super.init(collectionViewLayout:layout
)
        }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.whiteColor()
         collectionView?.contentInset = UIEdgeInsetsMake(navigationbarHeight  + tabBarHeight, 0, 0, 0)
        collectionView?.registerClass(MHHomeTitleBtnsView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: ReusableID)
        self.collectionView!.registerNib(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.mj_header = MHRefreshGifHeader(refreshingTarget: self, refreshingAction: #selector(self.refreshNewData(_:)))
    setUpRefresh()
    }
    func refreshNewData(header : MJRefreshGifHeader){
        
        
        
        //        if header.state == .Refreshing {
        //        header.stateLabel.hidden = true
        //        header.lastUpdatedTimeLabel.hidden = true
        performSelector(#selector(self.endRefresh), withObject: nil, afterDelay: 1.0)
        //        }
    }
    
    func endRefresh(){
        self.collectionView?.mj_header.endRefreshing()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func setUpRefresh(){
      
        
    }

    // MARK: UICollectionViewDataSource

//    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//
//        return 1
//    }

   
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 
        return 10
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MainCollectionViewCell
        // Configure the cell
  
        
        return cell
    }

    
    
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if  kind == UICollectionElementKindSectionHeader{
            let cell = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: ReusableID, forIndexPath: indexPath) as! MHHomeTitleBtnsView
            //            cell.imageScorllDelegate  = self
            //            cell.histroyBtnDelegate = self
            return cell
        }else{
            return UICollectionReusableView()
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSizeMake(UIScreen.mainScreen().bounds.width, titleCollectionViewHeight)
    }
//    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
//        if  kind == UICollectionElementKindSectionHeader{
//            let cell = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: ReusableID, forIndexPath: indexPath) as! HmPageCollectionReusableView
//            return cell
//        }else{
//            return UICollectionReusableView()
//        }
//    }
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        
//        return CGSizeMake(UIScreen.mainScreen().bounds.width, 140 )
//    }
  

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
