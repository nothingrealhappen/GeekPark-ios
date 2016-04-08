//
//  Notification.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/29.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import Foundation


class Notification: BaseModel{
  
  var type: String?
  var title: String?
  var content: String?
  var date: String?
  var cellType: String {
    get{ return self.type!+"NotificationCell"}
  }
  
  static func list(type: NotificationType, callback: ([Notification])-> ()){
    print(type)
    if type == .Comment {
      callback([])
      return
    }
    var list = [Notification]()
    for _ in 0...2{
      let n = Notification()
      n.title = "您的未来头条活动报名申请没有获得通过～"
      n.content = "很遗憾，活动太火爆了，当前活动报名人数过多，您的申请没有获得通过～"
      n.date = "3月18"
      n.type = type.rawValue
      list.append(n)
    }
    callback(list)
  }
  
}