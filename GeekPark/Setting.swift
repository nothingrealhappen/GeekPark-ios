//
//  Setting.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/11.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import Foundation

class Setting{
  var imageName: String?
  var title: String = ""
  
  init(title: String,imageName: String?){
    self.title = title
    self.imageName = imageName
  }
  
  
  static let userSettings = [
    [
      Setting(title: "登录/注册", imageName: "robot-icon")
    ],
    [
      Setting(title: "喜欢的文章", imageName: "fav-topic-icon"),
      Setting(title: "报名的活动", imageName: "applied-activity-icon"),
      Setting(title: "活动入场券", imageName: "tickets-icon"),
    ],
    [
      Setting(title: "设置", imageName: "setting-icon")
    ],
  ]
}
