//
//  NotificationGroup.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/8.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import Foundation

enum NotificationType: String {
  case Activity,System,Comment
}

class NotificationGroup: BaseModel{
  var unreadCount: Int = 0
  var type :NotificationType = .System
  var title: String?{
    switch self.type{
    case .System: return "系统消息"
    case .Activity: return "活动广播"
    case .Comment: return "评论回复"
    }
  }
  var content: String?{
    return (self.title ?? "") + "有新的通知了!"
  }
  var time: Int = Int(NSDate().timeIntervalSince1970)
  
  var imageName:String{
    return self.type.rawValue.lowercaseString + "-notification-icon"
  }
  
  static func list( callback: [NotificationGroup] -> () ){
    var notificationgroups = [NotificationGroup]()
    for i in 1...3 {
      let notificationGroup = NotificationGroup()
      notificationGroup.unreadCount = i
      notificationgroups += [notificationGroup]
    }
    notificationgroups[1].type = .Activity
    notificationgroups[2].type = .Comment
    callback(notificationgroups)
  }
}