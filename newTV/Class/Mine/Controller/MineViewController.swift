//
//  MineViewController.swift
//  newTV
//
//  Created by henghao.jiao on 16/11/24.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit

class MineViewController: UITableViewController {

    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var emailBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userIconBtn: UIButton!
    let btn = UIButton()
    let btnOnlie = UIButton()
    let btnRecord = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
    let sizeH = 70 * screenScale
    let space : CGFloat = 10
    func setUpUI(){
        self.tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0)
        self.navigationController?.navigationBarHidden = true
        userIconBtn.layer.cornerRadius = userIconBtn.mh_width * 0.5
        userIconBtn.layer.masksToBounds = true
        loginBtn.layer.borderWidth = 1.0
        loginBtn.layer.cornerRadius = 4
        loginBtn.layer.masksToBounds = true
        loginBtn.layer.borderColor = UIColor.whiteColor().CGColor
        registerBtn.layer.borderWidth = 1.0
        registerBtn.layer.borderColor = UIColor.whiteColor().CGColor
        registerBtn.layer.cornerRadius = 4
        registerBtn.layer.masksToBounds = true
        //        直播按钮
        let sizeH = 70 * screenScale
        let space : CGFloat = 10
        btn.frame = CGRectMake(screenW - sizeH - space , screenH - 49 - sizeH - space , sizeH, sizeH)
        btn.setBackgroundImage(UIImage(named: "btn_livevideo_start_user_59x59_"), forState: .Normal)
        self.navigationController?.view.insertSubview(btn, aboveSubview: self.tableView)
        btn.setBackgroundImage(UIImage(named: "btn_livevideo_close_user_59x59_"), forState: .Selected)
        btn.addTarget(self, action: #selector(self.onlineBtnClick(_:)), forControlEvents: .TouchDown)
        btnOnlie.frame = CGRectMake(btn.mh_x - space - sizeH, screenH - 49 - space - sizeH, 0, 0)
        btnOnlie.setBackgroundImage(UIImage(named: "btn_live_home_44x44_"), forState: .Normal)
        self.navigationController?.view.insertSubview(btn, aboveSubview: self.tableView)
        btnOnlie.setBackgroundImage(UIImage(named: "btn_live_home_44x44_"), forState: .Selected)
        btnOnlie.addTarget(self, action: #selector(self.MakeOnLineBtnClick), forControlEvents: .TouchDown)
        self.navigationController?.view.insertSubview(btnOnlie, aboveSubview: self.tableView)
//        btnOnlie.hidden = true
        self.btnRecord.frame = CGRectMake(screenW - self.sizeH - self.space , screenH - 49 - self.sizeH - self.space - self.sizeH - 20,0, 0)
        btnRecord.setBackgroundImage(UIImage(named: "btn_video_user_59x59_"), forState: .Normal)
        self.navigationController?.view.insertSubview(btn, aboveSubview: self.tableView)
        btnRecord.setBackgroundImage(UIImage(named: "btn_video_user_59x59_"), forState: .Selected)
        btnRecord.addTarget(self, action: #selector(self.recordBtnClick), forControlEvents: .TouchDown)
        self.navigationController?.view.insertSubview(btnRecord, aboveSubview: self.tableView)
//        btnRecord.hidden = true
        btnOnlie.transform = CGAffineTransformMakeScale(0, 0)
        btnRecord.transform = CGAffineTransformMakeScale(0, 0)

    }
    
//    录制
    func recordBtnClick() {
debugPrint(" 录制")
    }
//    直播
    func MakeOnLineBtnClick()  {
        debugPrint("直播")
    }
   
    func onlineBtnClick(btn:UIButton){
        
 
//        是否登录
        let anim = CAKeyframeAnimation(keyPath: "position")
        anim.repeatDuration = 2
        anim.repeatCount = 1
        anim.speed = 0.5
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(btn.mh_x, btn.mh_y - sizeH))
        path.addQuadCurveToPoint(CGPointMake(btnRecord.mh_x, btnRecord.mh_y - sizeH * 0.5), controlPoint: CGPointMake(btn.mh_x + 20 + sizeH * 0.5, btn.mh_y + 10))
//        path.addArcWithCenter(CGPointMake(btn.mh_x  + self.sizeH * 0.5 + 10, btn.mh_y + self.sizeH + 10 ), radius: (self.sizeH + 20) * 0.5 * sqrt(2), startAngle: CGFloat(M_PI * 5 * 0.25), endAngle: CGFloat(M_PI) * 1.5, clockwise: true)
        anim.path = path.CGPath
        self.btnRecord.layer.addAnimation(anim, forKey: nil)
        
        
        
        
        btnOnlie.transform = CGAffineTransformMakeScale(0, 0)
        btnRecord.transform = CGAffineTransformMakeScale(0, 0)
        btn.selected = !btn.selected
        btnRecord.hidden = false
        btnOnlie.hidden = false
        self.btn.transform = CGAffineTransformRotate(self.btn.transform, CGFloat(M_PI) * 0.5)
        UIView.animateWithDuration(2) {
             self.btnOnlie.transform = CGAffineTransformMakeScale(1, 1)
             self.btnRecord.transform = CGAffineTransformMakeScale(1, 1)
            self.btnOnlie.mh_size = CGSizeMake(self.sizeH, self.sizeH)
            self.btnRecord.mh_size = CGSizeMake(self.sizeH, self.sizeH)
          
        }
       
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        btn.selected = false
        
    }
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 44{
        scrollView.scrollEnabled = false
        }else{
         scrollView.scrollEnabled = true
            }
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        debugPrint(indexPath.row)
    }



}
