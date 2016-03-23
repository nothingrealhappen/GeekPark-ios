//
//  Activity.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/21.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import Foundation
import UIKit


class Activity: BaseModel{
  
  var id = ""
  var title = ""
  var start_at = ""
  var introduction :String?
  var status = ""
  var location :String?
  var banner: String?
  
  static func list(page: Int,per: Int = 20 , callback: ([Activity]) -> Void ){
    doRequest(router: "activities", params: ["page":page,"per":per]){ status,result in
      if status == .SUCCESS {
        let activities = [Activity](json: result!["activities"].rawString())
        callback(activities)
      }else{
      }
    }
  }
  
  let statusMap = [
    "end": "已结束",
    "applying": "报名中",
    "preparing": "准备中",
    "progressing": "进行中"
  ]
  let statusColorMap = [
    "end": UIColor(red: 28/255.0, green: 199/255.0, blue: 107/255.0, alpha: 1),
    "applying": UIColor(red: 217/255.0, green: 210/255.0, blue: 32/255.0, alpha: 1),
    "preparing": UIColor(red: 28/255.0, green: 199/255.0, blue: 107/255.0, alpha: 1),
    "progressing": UIColor(red: 217/255.0, green: 210/255.0, blue: 32/255.0, alpha: 1),
  ]
  
  func statusText() -> String?{
    return statusMap[self.status] ?? statusMap["end"]
  }
  
  func statusColor() -> UIColor? {
    return statusColorMap[self.status] ?? statusColorMap["end"]
  }
  
}


