//
//  MHURLManager.swift
//  newTV
//
//  Created by henghao.jiao on 16/11/14.
//  Copyright © 2016年 menhao. All rights reserved.
//

import UIKit
import Alamofire


enum RequestMethod : String {
    case RequestMethodRestGET
    case RequestMethodRestPOST
}

class MHURLManager{
    static let sharedInstance = MHURLManager()
    var baseURL : String?
    var requestUrlString: String?
    var requestParameters: [String : AnyObject]?
    var requestMethod : RequestMethod?
//    var parameterEncodingDataType :ParameterEncoding?
    var requestHeaders:[String:String]?
    
//    不同环境的baseurl不同。
func getBaseURL() ->String {

    #if DEBUG
        baseURL = "http://capi.douyucdn.cn"
    #elseif  OTHER
        baseURL = "http://capi.douyucdn.cn"
    #elseif  PRERELEASE
        baseURL = "http://capi.douyucdn.cn"
    #elseif  RELEASE
        baseURL = "http://capi.douyucdn.cn"
    #elseif TEST
        baseURL = "http://capi.douyucdn.cn"
        
    #endif
    return baseURL!
    
    }
    
//    首页推荐
    func getHomePageRecommendParameters() -> MHURLManager{
        requestUrlString = getBaseURL() + ""
        requestParameters = ["":""]
        requestMethod = .RequestMethodRestGET
        return MHURLManager.sharedInstance
        
    }
    //    首页游戏
    func getHomePageGamesParameters()-> MHURLManager{
        requestUrlString = getBaseURL() + "/api/v1/getColumnDetail?shortName=game&client_sys=ios"
        requestMethod = .RequestMethodRestGET
        return MHURLManager.sharedInstance
        
    }
    //    首页娱乐
    func getHomePageAmuseParameters()-> MHURLManager{
        requestUrlString = getBaseURL() + "/api/v1/getHotRoom/2?aid=ios&client_sys=ios&time=1478184060&auth=b950d8de0b3c4e259263f1d25d43fed5"
        requestMethod = .RequestMethodRestGET
        return MHURLManager.sharedInstance
        
    }
    //    首页趣玩
    func getHomePageAmusingPlayParameters()-> MHURLManager{
        
        requestUrlString = getBaseURL() + ""
        requestParameters = ["":""]
        requestMethod = .RequestMethodRestGET
        return MHURLManager.sharedInstance
    }
    
}
