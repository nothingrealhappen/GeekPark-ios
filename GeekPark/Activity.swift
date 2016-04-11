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
  var comments: [Comment]?
  var audiences_count = 0
 
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
        Comment.list("activity", commentable_id: id){
          comments in
          activity.comments = comments
          callback(activity)
        }
      } else {
      }
    }
  }
  
  func infoDictionary() -> NSArray{
    return [["image": "activity-icon", "value": title, "status": status], ["image": "clock-icon", "value": NSDate.formateTimeFromTimeStamp(timestamp_start_at, formateString: "MM.dd hh:mm") ?? ""], ["image": "location-icon", "value": location ?? "", "arrow": ""]]
  }
  
  static let statusMap = [
    "end": "已结束",
    "applying": "报名中",
    "examing": "审核中",
    "progressing": "进行中"
  ]
  
  static let statusColorMap = [
    "end": UIColor(red: 160/255.0, green: 160/255.0, blue: 160/255.0, alpha: 1),
    "applying": UIColor(red: 45/255.0, green: 198/255.0, blue: 105/255.0, alpha: 1),
    "examing": UIColor(red: 45/255.0, green: 198/255.0, blue: 105/255.0, alpha: 1),
    "progressing": UIColor(red: 220/255.0, green: 146/255.0, blue: 1/255.0, alpha: 1),
  ]
  
  func statusText() -> String?{
    return Activity.statusMap[self.status] ?? Activity.statusMap["applying"]
  }
  
  func statusColor() -> UIColor? {
    return Activity.statusColorMap[self.status] ?? Activity.statusColorMap["applying"]
  }
  
}


