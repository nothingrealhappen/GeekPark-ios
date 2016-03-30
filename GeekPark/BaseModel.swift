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
  
  static let api_root = "http://events.geekpark.net/api/v2/"
//  static let api_root = "http://127.0.0.1:3000/api/v2/"
  
  static func doRequest(
    method:Alamofire.Method = .GET,
    router: String ,
    params: [String: AnyObject]?,
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
  
  
}