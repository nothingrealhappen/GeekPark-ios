//
//  BaseModel.swift
//  GeekPark
//
//  Created by 朱坤 on 3/18/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import EVReflection

public enum Status{
  case SUCCESS, FAILD , ERROR
}

class BaseModel: EVObject{
  
//  static let event_api_root = "http://events.geekpark.net/api/v2/"
  static let event_api_root = "http://lh:3000/api/v2/"
  static let main_api_root = "http://lh:3001/api/v1/"
//  static let main_api_root = "http://www.geekpark.net/api/v1/"
  
  static func doRequest(
    method:Alamofire.Method = .GET,
    router: String ,
    api_root: String = event_api_root,
    params: [String: AnyObject]? = nil,
    callback: (Status,JSON?)->()
    )
  {
    Alamofire.request(method, "\(api_root)\(router)", parameters: params)
      .responseJSON { response in
        if response.response?.statusCode > 300 || response.response?.statusCode < 200{
          callback(.ERROR,nil)
          return
        }else{
          guard let data = response.data else { callback(.FAILD,nil) ; return }
          callback(.SUCCESS,JSON(data: data))
        }
    }
  }
  
  static func doRequest(
    method:Alamofire.Method = .GET,
    router: String ,
    params: [String: AnyObject]? = nil,
    api_root: String = event_api_root,
    dataHandler: GDataHandler,
    callback: (JSON?)->()
    )
  {
    doRequest(router: router, params: params,api_root:api_root){ status,result in
      switch status{
      case .SUCCESS: callback(result)
      case .ERROR: dataHandler.onDataError()
      case .FAILD: dataHandler.onDataEmpty()
      }
    }
  }
  
}