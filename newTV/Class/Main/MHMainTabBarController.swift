//
//  MHMainTabBarController.swift
//  newTV
//
//  Created by kkkmr on 16/9/11.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit

class MHMainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 9.0, *) {
            let tabar = UITabBar.appearanceWhenContainedInInstancesOfClasses([MHMainTabBarController.self])
        } else {
            // Fallback on earlier versions
        }
//        tabar.backgroundImage = UIImage(named: "BJTabBar")
        addChildViewController(HomeViewController(), image: UIImage(named: "btn_home_normal_24x24_")!, selectedImage: UIImage(named: "btn_home_selected_24x24_")!, title: "首页")
        addChildViewController(LiveCollectionViewController(), image: UIImage(named: "btn_column_normal_24x24_")!, selectedImage: UIImage(named: "btn_column_selected_24x24_")!, title: "直播")
        addChildViewController(ConcernCollectionViewController(), image: UIImage(named: "btn_live_normal_30x24_")!, selectedImage: UIImage(named: "btn_live_selected_30x24_")!, title: "关注")
        let mineViewController = UIStoryboard.init(name: "MineViewController", bundle: nil).instantiateInitialViewController()
         addChildViewController(mineViewController!, image: UIImage(named: "btn_user_normal_24x24_")!, selectedImage: UIImage(named: "btn_user_selected_24x24_")!, title: "我的")

            }

    func addChildViewController(childController: UIViewController,image:UIImage,selectedImage:UIImage,title : String) {
        
        childController.tabBarItem.selectedImage = selectedImage.imageWithRenderingMode(.AlwaysOriginal)
        childController.tabBarItem.image = image.imageWithRenderingMode(.AlwaysOriginal)
        childController.tabBarItem.title = title
        childController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.grayColor(),NSFontAttributeName:UIFont.systemFontOfSize(12)], forState: .Normal)
        childController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orangeColor(),NSFontAttributeName:UIFont.systemFontOfSize(12)], forState: .Selected)
        
         
        addChildViewController(MHNavigationController(rootViewController : childController))
        
        
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
