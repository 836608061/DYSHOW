//
//  MHRefreshGifHeader.swift
//  newTV
//
//  Created by henghao.jiao on 16/9/25.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit

class MHRefreshGifHeader: MJRefreshGifHeader {
    let headerX = 70
    let headerY = 0
    let headerIw = 64
    let headerIh = 66
    // mark - 重写方法
    // mark 在这里做一些初始化配置（比如添加子控件）
    override func prepare() {
        super.prepare()
        self.mj_h = 76
        self.setImages([UIImage(named:"dyla_img_mj_stateIdle_64x66_")!], forState: .Idle)
        self.setImages([UIImage(named:"dyla_img_mj_statePulling_64x66_")!], forState: .Pulling)
        self.setImages([UIImage(named:"dyla_img_mj_stateRefreshing_01_135x66_")!,UIImage(named:"dyla_img_mj_stateRefreshing_02_135x66_")!,UIImage(named:"dyla_img_mj_stateRefreshing_03_135x66_")!,UIImage(named:"dyla_img_mj_stateRefreshing_04_135x66_")!], forState: .Refreshing)
        self.setTitle("下拉可以刷新", forState: .Idle)
        self.setTitle("松开立即刷新", forState: .Pulling)
        self.lastUpdatedTimeKey = MJRefreshHeaderLastUpdatedTimeKey
    }
   // mark 在这里设置子控件的位置和尺寸
    override func placeSubviews() {
        super.placeSubviews()
        self.gifView.contentMode = .ScaleAspectFit
    
            self.gifView.frame = CGRectMake(CGFloat(headerX), CGFloat(headerY), CGFloat(headerIw + 135 - 64), CGFloat(headerIh))
        if self.state == .Idle || self.state == .Pulling{
            self.gifView.contentMode = .TopLeft
        }

        self.stateLabel.frame = CGRectMake(CGFloat(80 + 64 ), CGFloat(headerY + 20), 200, 20)
        self.lastUpdatedTimeLabel.frame = CGRectMake(CGFloat(80 + 64), CGFloat(headerY + 50), 200, 20)
        self.lastUpdatedTimeLabel.textAlignment = .Left
        self.stateLabel.textAlignment = .Left
        

    }
// mark 监听scrollView的contentOffset改变
    override func scrollViewContentOffsetDidChange(change: [NSObject : AnyObject]!) {
        super.scrollViewContentOffsetDidChange(change)
    }
//mark 监听scrollView的拖拽状态改变
    override func scrollViewPanStateDidChange(change: [NSObject : AnyObject]!) {
       
        
super.scrollViewPanStateDidChange(change)

   
}
//   mark 监听scrollView的contentSize改变
    
    override func scrollViewContentSizeDidChange(change: [NSObject : AnyObject]!) {
        super.scrollViewContentSizeDidChange(change)
    }
//    mark 监听控件的刷新状态
    override var state: MJRefreshState{
    
        didSet{
            self.gifView.contentMode = .TopLeft
            self.lastUpdatedTimeLabel.hidden = false
            self.stateLabel.hidden = false
            if state == .Refreshing{
                self.lastUpdatedTimeLabel.hidden = true
                self.stateLabel.hidden = true
            }


            
        }
    }
//    mark 监听拖拽比例（控件被拖出来的比例）
    override var pullingPercent: CGFloat{
        didSet{
               }
    }
}
