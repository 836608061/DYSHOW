//
//  HomePageCollectionViewController.swift
//  newTV
//
//  Created by kkkmr on 16/9/11.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let ReusableID = "ReusableID"
class HomePageCollectionViewController: MHBaseCollectionViewController ,HmPageCollectionReusableViewDelegate,HistroyBtnViewDelegate{

      override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.registerNib(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.registerNib(UINib.init(nibName: "HmPageCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: ReusableID)
         }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
      // MARK: setUpUI

    // MARK: touchEvent
    func refreashData(){
        
    }
 
    // MARK: UICollectionViewDataSource
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 15
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MainCollectionViewCell
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        navigationController?.pushViewController(MainPlayerViewController(), animated: true)
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if  kind == UICollectionElementKindSectionHeader{
            let cell = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: ReusableID, forIndexPath: indexPath) as! HmPageCollectionReusableView
            cell.imageScorllDelegate  = self
            cell.histroyBtnDelegate = self
            return cell
        }else{
            return UICollectionReusableView()
        }
    }
    
    override func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSizeMake(UIScreen.mainScreen().bounds.width, HMpageAdImageViewHeight )
    }
    
    func HistroyBtnDidClick(index: Int) {
         navigationController?.pushViewController(MainHistroyCollectionViewController(), animated: true)
    }
    
    func imageViewDidTap(index: Int) {
        if index == 0{
            navigationController?.pushViewController(ImageCycleViewController(), animated: true)
        }else{
            navigationController?.pushViewController(MainPlayerViewController(), animated: true)
        }
    }
}

// MARK: extension-UIBarButtonItem
extension UIBarButtonItem{
    
    func setBtn(target : AnyObject?,action:Selector,imageName : String,imageHight: String) ->UIBarButtonItem{
        
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), forState: .Normal)
        btn.setImage(UIImage(named: imageHight), forState: .Highlighted)
        btn.sizeToFit()
        btn.mh_width += 20
        
        if "logo_66x26_" == imageName{
            
            btn.contentEdgeInsets = UIEdgeInsetsMake(0, -45, 0, 0)
        }
        btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        return UIBarButtonItem(customView: btn)
        
        
        
    }
    
    
}



