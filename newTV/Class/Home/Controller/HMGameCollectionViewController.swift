//
//  HMGameCollectionViewController.swift
//  newTV
//
//  Created by menhao on 16/9/15.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit
import Alamofire
private let reuseIdentifier = "Cell"

class HMGameCollectionViewController: MHBaseCollectionViewController {
 
     var homeGameDatasourceArray = [HMHomeGameModel]()
    override func viewDidLoad() {
          super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets =  false
       
        MHNetWorkManager.sharedInstance.loadRequest( MHURLManager.sharedInstance.getHomePageGamesParameters(),delegate: self)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    deinit{
    
        debugPrint("HMGameCollectionViewController---deinit")
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        

        
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return homeGameDatasourceArray.count
    }

    
    
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MainCollectionViewCell
    
       
        cell.mhDataSource = homeGameDatasourceArray[indexPath.row]
        return cell
    }
    
    


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


extension HMGameCollectionViewController:MHNetWorkManagerDelegate{
 
    func responseDidSuccessCallBack(response: Response<AnyObject, NSError>?) {
        guard let resultDic = response?.result.value else{ return}
        let arrM = HMHomeGameModel.mj_objectArrayWithKeyValuesArray(resultDic["data"]) as NSArray
        homeGameDatasourceArray = arrM as! [HMHomeGameModel]
        collectionView?.reloadData()
    }
    
    func responseDidFailCallBack(error: NSError?) {
        debugPrint(error)
        
    }
    
    
}
