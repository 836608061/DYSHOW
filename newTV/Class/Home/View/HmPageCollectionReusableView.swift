//
//  HmPageCollectionReusableView.swift
//  newTV
//
//  Created by menhao on 16/9/15.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit
protocol HmPageCollectionReusableViewDelegate : class{
    func imageViewDidTap(index:Int)
    
}
protocol HistroyBtnViewDelegate : class{
    func HistroyBtnDidClick(index:Int)
    
}
class HmPageCollectionReusableView: UICollectionReusableView ,UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource{
    private let Identifier = "Identifier"
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollViewAD: UIScrollView!
    var timer :NSTimer?
    var index = 1
//    var imageUrlArray = ["http://c.hiphotos.baidu.com/image/h%3D200/sign=89c6743711ce36d3bd0484300af23a24/ae51f3deb48f8c54469d4dc23e292df5e1fe7f95.jpg","http://b.hiphotos.baidu.com/image/h%3D200/sign=234bd32e09d79123ffe093749d355917/0823dd54564e925838c205c89982d158ccbf4e26.jpg","http://pic1.win4000.com/pic/b/6e/5aee949474.jpg","http://pic1.win4000.com/pic/b/6e/5aee949477.jpg","http://pic1.win4000.com/pic/b/6e/5aee949481.jpg","http://pic1.win4000.com/pic/b/6e/5aee949529.jpg","http://pic1.win4000.com/pic/2/51/5aeb948289.jpg"]
    var imageUrlArray = ["1_120312100435_8.jpg","3c6d55fbb2fb4316fc06edda24a4462309f7d371.jpg","9213b07eca80653893a554b393dda144ac3482c7.jpg","192654ai88zf6zaa60zddo.jpg","2934349b033b5bb54352dd5e32d3d539b700bc8d.jpg","6159252dd42a2834bc76c4ab5fb5c9ea14cebfba.jpg","u=3133957629,4241246975&fm=21&gp=0.jpg"]
     let imageLeft = UIImageView()
     let imageMid = UIImageView()
     let imageRight = UIImageView()
    var histroyBtnView : UICollectionView?
   weak var imageScorllDelegate : HmPageCollectionReusableViewDelegate?
    weak var histroyBtnDelegate : HistroyBtnViewDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
       //轮播器
        setUpScrollView()
      
        setUpHistoryBtnView()
        
        addTimer()
        
    }
    
     func setUpHistoryBtnView() {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSizeMake(80, 80)
    layout.minimumInteritemSpacing = 1
    layout.minimumLineSpacing = 1
    layout.scrollDirection = .Horizontal
    
    //底部圆形按钮
    histroyBtnView = UICollectionView(frame: CGRectMake(0, HMpageAdImageViewHeight - 100, screenW, 80), collectionViewLayout: layout)
    self.addSubview(histroyBtnView!)
    histroyBtnView!.showsVerticalScrollIndicator = false
    histroyBtnView!.showsHorizontalScrollIndicator = false
    histroyBtnView!.dataSource = self
    histroyBtnView!.delegate = self
    histroyBtnView!.registerNib(UINib.init(nibName: "AdBtnsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Identifier)
    }
    func setUpScrollView(){
        scrollViewAD.frame = CGRectMake(0, 0, screenW, HMpageAdImageViewHeight)
        scrollViewAD.contentSize = CGSizeMake(screenW * 3, HMpageAdImageViewHeight - 125)
        scrollViewAD.pagingEnabled = true
        scrollViewAD.showsVerticalScrollIndicator = false
        scrollViewAD.showsHorizontalScrollIndicator = false
        scrollViewAD.bounces = false
        scrollViewAD.delegate  = self
        
        let arrayImageV = [imageLeft,imageMid,imageRight]
        imageMid.userInteractionEnabled = true
        imageMid.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageMidClick)))
        var i = 0
        for imageV in arrayImageV{
            scrollViewAD.addSubview(imageV)
            imageV.frame = CGRectMake(screenW * CGFloat(i), 0, screenW, HMpageAdImageViewHeight - 125)
          
            imageV.backgroundColor = UIColor.randomColor
            imageV.image = UIImage(named: imageUrlArray[i])
              i += 1
        }
        pageControl.currentPage = 1
        pageControl.numberOfPages = imageUrlArray.count
    }
    
    func imageMidClick(){
       imageScorllDelegate?.imageViewDidTap(index)
        
    }
    func addTimer(){
       timer = NSTimer(timeInterval: 2.0, target: self, selector: #selector(self.refeashImage), userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
    }
    
    func  invalidateTimer(){
        timer?.invalidate()
    }
    func refeashImage(){
    scrollViewAD.setContentOffset(CGPointMake(screenW * 2, 0), animated: true)
           }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
    changeImage(scrollView)
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    changeImage(scrollView)
 
    }
    
    func changeImage(scrollView : UIScrollView){
        if scrollView.isKindOfClass(UICollectionView){return}
        let offSet = Int(scrollView.contentOffset.x / screenW + 0.5)
        if offSet == 1{return }
        if offSet == 0{
            index = index - 1
            if  index == -1{
                index = imageUrlArray.count - 1
            }
        }
        else if offSet == 2{
            index = index + 1
            if index >= imageUrlArray.count{
                index = 0
            }
        }
        pageControl.currentPage = index
        imageMid.image = UIImage(named: imageUrlArray[index])
        imageRight.image = UIImage(named: imageUrlArray[(index + 1)%( imageUrlArray.count)])
        imageLeft.image = UIImage(named: imageUrlArray[(imageUrlArray.count + index - 1)%(imageUrlArray.count)])
        scrollView.contentOffset.x = screenW
    }
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        invalidateTimer()
    }
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Identifier, forIndexPath: indexPath) as! AdBtnsCollectionViewCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        histroyBtnDelegate?.HistroyBtnDidClick(indexPath.row)
    }
}
