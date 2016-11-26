//
//  MainPlayerViewController.swift
//  newTV
//
//  Created by menhao on 16/9/17.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit

class MainPlayerViewController: UIViewController {

    @IBOutlet weak var toolBarBottom: NSLayoutConstraint!
    @IBOutlet weak var myToolBar: UIToolbar!
    @IBOutlet weak var fullScreenBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var closeGift: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var textFiled: UITextField!
    let subwind = UIImageView()
//    let imageV = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.hidden = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyBoardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
   
        
        subwind.frame = CGRectMake(screenW - 91.5, screenH + 216, 60, 46)
        subwind.backgroundColor = UIColor.redColor()

        textFiled.mh_width = screenW - 160
        textFiled.spellCheckingType = .No
        textFiled.autocorrectionType = .No
        textFiled.autocapitalizationType = .None

        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
//        UIView.animateWithDuration(0.25) {
            self.view.layoutIfNeeded()
            self.toolBarBottom.constant = 0
            
            
//            self.subwind.frame = CGRectMake(screenW - 40, screenH + 216, 91.5, 46)
        self.subwind.mh_y = screenH + 216

            
//        }
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
        
    }
    
    func keyBoardWillShow(noti:NSNotificationCenter){
//        self.imageV.frame = CGRectMake(screenW - 40, screenH + 216, 40, 40)
        //        self.view.insertSubview(imageV, aboveSubview: view)
        
        let window = UIApplication.sharedApplication().windows.last
        //        window?.hidden = false
      
        window?.addSubview(subwind)

        print(noti)
//        UIView.animateWithDuration(0.25) {
         self.toolBarBottom.constant = 216
           self.view.layoutIfNeeded()
 
            self.subwind.mh_y = screenH - 46

//        }
        
    }
    @IBAction func backBtnClick(sender: AnyObject) {
          navigationController?.navigationBar.hidden = false
        navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func fullScreenClick(sender: AnyObject) {
    }
    @IBAction func closeGiftClick(sender: AnyObject) {
    }
    @IBAction func shareBtnClick(sender: AnyObject) {
    }
  
    @IBOutlet weak var iconBtnClick: UIButton!
    @IBAction func pauseBtnClick(sender: AnyObject) {
    }
    @IBAction func buyBtnClick(sender: AnyObject) {
    }
 
    @IBAction func giftBtnClick(sender: AnyObject) {
    }
    
   
    
        
    }

    
    
//     override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return UIStatusBarStyle.LightContent
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


