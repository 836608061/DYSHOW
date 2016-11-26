//
//  MHNavigationController.swift
//  newTV
//
//  Created by kkkmr on 16/9/11.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit

class MHNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func popBackViewCotroller(){
        popViewControllerAnimated(true)
//        self.hidesBottomBarWhenPushed = false
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return (self.topViewController?.preferredStatusBarStyle())!
    }
    override func pushViewController(viewController: UIViewController, animated: Bool) {
       
        if childViewControllers.count > 0 {
            let btn = UIButton()
            btn.setImage(UIImage(named:"btn_nav_back_16x16_" ), forState: .Normal)
            btn.setImage(UIImage(named:"btn_nav_back_click_18x18_" ), forState: .Highlighted)
            btn.bounds = CGRectMake(0, 0, 44, 44)
            btn.addTarget(self, action: #selector(self.popBackViewCotroller), forControlEvents: .TouchUpInside)
            btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
            viewController.hidesBottomBarWhenPushed = true

        }
         super.pushViewController(viewController, animated: animated)
                    }
    
        
       
    }
//    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
//        super.popViewControllerAnimated(animated)
//        
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


