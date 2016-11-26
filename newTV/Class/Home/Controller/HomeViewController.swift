//
//  HomeViewController.swift
//  newTV
//
//  Created by menhao on 16/9/14.
//  Copyright © 2016年 menhao. All rights reserved.
//
private let reuseIdentifier = "Cell1"
import UIKit

class HomeViewController: UICollectionViewController {
    
    let btnTagBase = 201
    let titleView = UIView()
    let bottomView = UIView()
    var lastBtn = TitleButton()
    let hmGameCV = HMGameCollectionViewController()
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .Horizontal
        layout.itemSize = CGSizeMake(screenW, screenH - 64 - 49)
        super.init(collectionViewLayout:layout
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     //MARK: systemsInterVal
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        setUptitleBar()
        setUpCollectionView()
//        setUpRefresh()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    //MARK: setUpUI
 
    
    
    func setUpCollectionView(){
        self.automaticallyAdjustsScrollViewInsets = false
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.showsVerticalScrollIndicator = false
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.collectionView?.pagingEnabled = true
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        let hmPageCV = HomePageCollectionViewController()
        self.addChildViewController(hmPageCV)
        self.collectionView?.addSubview(hmPageCV.collectionView!)
        view.backgroundColor = UIColor.whiteColor()

        
    }
    func setUpNavigationBar(){
        self.automaticallyAdjustsScrollViewInsets = false
        navigationItem.leftBarButtonItem = UIBarButtonItem().setBtn(self, action: #selector(self.refreashData), imageName: "logo_66x26_",imageHight:"logo_66x26_" )
        let watchHistoryBtn = UIBarButtonItem().setBtn(self, action: #selector(self.wicthHistroyBarClick), imageName: "image_my_history_26x26_",imageHight:"Image_my_history_click_22x22_" )
        let searchBtn = UIBarButtonItem().setBtn(self, action: #selector(self.searchBarClick), imageName: "btn_search_22x22_",imageHight:"btn_search_clicked_22x22_")
        let qrBtn = UIBarButtonItem().setBtn(self, action: #selector(self.qrBarClick), imageName: "Image_scan_22x22_",imageHight: "Image_scan_click_22x22_")
        navigationItem.rightBarButtonItems = [watchHistoryBtn,searchBtn,qrBtn]
      
        
    }
  
   
    func setUptitleBar(){
        
        
        titleView.backgroundColor = UIColor.whiteColor()
        titleView.frame = CGRectMake(0, 64, UIScreen.mainScreen().bounds.width, titleViewHeight)
        let btnW = UIScreen.mainScreen().bounds.width / CGFloat(titleBtnCount)
        let arrayBtnTitle = ["推荐","游戏","娱乐","趣玩"]
        bottomView.frame = CGRectMake(0, titleViewHeight - 3, btnW, 2)
        bottomView.backgroundColor = UIColor.orangeColor()
        titleView.addSubview(bottomView)
        for i in 0..<titleBtnCount{
            let btn = TitleButton()
            titleView.addSubview(btn)
            btn.frame = CGRectMake(CGFloat(i) * btnW, 0, btnW, titleViewHeight)
            btn.setTitle(arrayBtnTitle[i], forState: .Normal)
            btn.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
            btn.setTitleColor(UIColor.orangeColor(), forState: .Selected)
            btn.tag = i + btnTagBase
            btn.titleLabel?.font = UIFont.systemFontOfSize(16)
            btn.addTarget(self, action: #selector(self.titleLabelButtonClick(_:)), forControlEvents: .TouchDown)
            if i == 0 {
                btn.selected = true
                lastBtn = btn
            }
        }
        view.addSubview(titleView)
        
    }
    
    
    // MARK: touchEvent
    
  
    func refreashData(){
        
    }
    
    
    func wicthHistroyBarClick(){
        
    }
    
    func searchBarClick(){
        
        }
    
    func qrBarClick(){
    navigationController?.pushViewController(QrViewController(), animated: true)
        
    }
   
    func titleLabelButtonClick(btn : TitleButton){
        UIView.animateWithDuration(0.25) {
            self.bottomView.mh_x = CGFloat(btn.tag - self.btnTagBase)  * self.bottomView.mh_width
        }
        let indexPath = NSIndexPath(forItem: btn.tag - btnTagBase, inSection: 0)
        collectionView?.selectItemAtIndexPath(indexPath, animated: false, scrollPosition: .CenteredHorizontally)
         btnChoice(btn)
    }
  
    func btnChoice(btn : TitleButton){
        
     debugPrint(btn.tag)
        if lastBtn == btn{
            btn.selected = true
        }else{
            lastBtn.selected = false
            btn.selected = !btn.selected
        }
           lastBtn = btn
     
        switch btn.tag {
        case 202:
            
             
            
            if self.childViewControllers.contains(hmGameCV){return }
            self.addChildViewController(hmGameCV)
            hmGameCV.collectionView!.frame = CGRectMake(UIScreen.mainScreen().bounds.width, 0, view.mh_width, view.mh_height)
            self.collectionView?.addSubview(hmGameCV.collectionView!)
            
            debugPrint(self.childViewControllers.count)
            
        case 203:
            
            if self.childViewControllers.contains(hmGameCV){return }
            self.addChildViewController(hmGameCV)
            hmGameCV.collectionView!.frame = CGRectMake(UIScreen.mainScreen().bounds.width, 0, view.mh_width, view.mh_height)
         
            
            
            self.collectionView?.addSubview(hmGameCV.collectionView!)
            
            
        case 204:
            
            if self.childViewControllers.contains(hmGameCV){return }
            self.addChildViewController(hmGameCV)
            hmGameCV.collectionView!.frame = CGRectMake(UIScreen.mainScreen().bounds.width, 0, view.mh_width, view.mh_height)
            self.collectionView?.addSubview(hmGameCV.collectionView!)
            
        default:
           
            if self.childViewControllers.contains(hmGameCV){return }
            self.addChildViewController(hmGameCV)
            hmGameCV.collectionView!.frame = CGRectMake(UIScreen.mainScreen().bounds.width, 0, view.mh_width, view.mh_height)
            self.collectionView?.addSubview(hmGameCV.collectionView!)
        }
        

//        
//        for childViewContrller in childViewControllers {
//            if childViewContrller.isKindOfClass(HMGameCollectionViewController) == false{
//                self.addChildViewController(hmGameCV)
//                hmGameCV.collectionView!.frame = CGRectMake(UIScreen.mainScreen().bounds.width, 0, view.mh_width, view.mh_height)
//                self.collectionView?.insertSubview(hmGameCV.collectionView!, atIndex: 10)
//                
//            }
//        }
   
        
        
     
    }
    // MARK: UICollectionViewDataSource
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        // Configure the cell
      
        return cell
    }

    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let offSetCount = (scrollView.contentOffset.x/screenW)
        let tag = Int(offSetCount) + btnTagBase
        let btn = titleView.viewWithTag(tag) as! TitleButton
        btnChoice(btn)
    }
 
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let offSetCount = (scrollView.contentOffset.x/screenW)
        self.bottomView.mh_x = CGFloat(offSetCount)  * self.bottomView.mh_width
        
    }
//
    deinit{
    
        debugPrint("HomeViewController--deinit")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
