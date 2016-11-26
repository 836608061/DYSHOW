//
//  MHNetWorkManager.swift
//  newTV
//
//  Created by henghao.jiao on 16/11/5.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit
import Alamofire

protocol MHNetWorkManagerDelegate:class {
    func responseDidSuccessCallBack(response: Response<AnyObject, NSError>?)
    func responseDidFailCallBack(error : NSError?)
}

class MHNetWorkManager{
static let sharedInstance = MHNetWorkManager()
    private init(){}
    
    weak var delegate :MHNetWorkManagerDelegate?
    func loadRequest(urlManager : MHURLManager,delegate : MHNetWorkManagerDelegate){
        
        self.delegate = delegate
        if urlManager.requestMethod == RequestMethod.RequestMethodRestPOST{
        
         let requst =  Alamofire.request(.POST, urlManager.requestUrlString!, parameters: urlManager.requestParameters!, encoding: .JSON, headers: nil).validate()
  
            requst.responseJSON(queue: dispatch_get_main_queue(), completionHandler: { (response) in
                switch response.result {
                case .Success:
                self.delegate?.responseDidSuccessCallBack(response)
                case .Failure(let error):
                self.delegate?.responseDidFailCallBack(error)
                }
            })
        
        }else{
        
            let requst =  Alamofire.request(.GET, urlManager.requestUrlString!, parameters: nil, encoding: .JSON, headers: nil).validate()
            
            requst.responseJSON(queue: dispatch_get_main_queue(), completionHandler: { (response) in

                
                    response.result.value?.writeToFile("/Users/henghao.jiao/Desktop/my.plist", atomically: true)

                switch response.result.isSuccess {
                case true:
                    self.delegate?.responseDidSuccessCallBack(response)
                case false:
                    self.delegate?.responseDidFailCallBack(response.result.error)
                }            })

        }

}

 
    
    
}

    
    
    
    

