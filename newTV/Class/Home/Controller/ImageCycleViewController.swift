//
//  ImageCycleViewController.swift
//  newTV
//
//  Created by menhao on 16/9/17.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit

class ImageCycleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "最佳阵容"
       let scrollV = UIScrollView(frame: view.bounds)
        scrollV.contentSize = CGSizeMake(screenW, 3 * screenH)
        view.addSubview(scrollV)
        scrollV.backgroundColor = UIColor.yellowColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
