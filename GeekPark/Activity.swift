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
  var timestamp_start_at = ""
  var introduction: String?
  var status = ""
  var location: String?
  var banner: String?
  var speeches: [Speech]?
  var audiences: [Audience]?
 
  static func list(page: Int,per: Int = 20 , callback: ([Activity]) -> Void ){
    doRequest(router: "activities", params: ["page":page,"per":per]){ status,result in
      if status == .SUCCESS {
        let activities = [Activity](json: result!["activities"].rawString())
        callback(activities)
      }else{
      }
    }
  }
  
  static func member(id: String, callback: (Activity) -> Void){
    doRequest(router: "activities/\(id)", params: nil){ status, result in
      if status == .SUCCESS{
        let activity = Activity(json: result!["activity"].rawString())
        callback(activity)
      } else {
      }
    }
  }
  
  func infoDictionary() -> NSArray{
    return [["title": "活动", "value": title], ["title": "时间", "value": NSDate.formateTimeFromTimeStamp(timestamp_start_at, formateString: "YYYY.MM.DD.hh:mm") ?? ""], ["title": "地点", "value": location ?? ""]]
  }
  
  let statusMap = [
    "end": "已结束",
    "applying": "报名中",
    "progressing": "进行中"
  ]
  
  let statusColorMap = [
    "end": UIColor(red: 160/255.0, green: 160/255.0, blue: 160/255.0, alpha: 1),
    "applying": UIColor(red: 45/255.0, green: 198/255.0, blue: 105/255.0, alpha: 1),
    "progressing": UIColor(red: 220/255.0, green: 146/255.0, blue: 1/255.0, alpha: 1),
  ]
  
  func statusText() -> String?{
    return statusMap[self.status] ?? statusMap["applying"]
  }
  
  func statusColor() -> UIColor? {
    return statusColorMap[self.status] ?? statusColorMap["applying"]
  }
  
}


