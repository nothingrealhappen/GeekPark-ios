//
//  Setting.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/11.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

class Setting{
  var imageName: String?
  var title: String = ""
  var controller: UIViewController?
  
  init(title: String,imageName: String?, controller: UIViewController?){
    self.title = title
    self.imageName = imageName
    self.controller = controller
  }
  
  
  static let userSettings = [
    [
      Setting(title: "登录/注册", imageName: "robot-icon", controller: nil)
    ],
    [
      Setting(title: "喜欢的文章", imageName: "fav-topic-icon",
        controller: TopicsPageViewController.initByName("Topic")),
      Setting(title: "报名的活动", imageName: "applied-activity-icon",
        controller: ActivitiesViewController.initByName("Activity")),
      Setting(title: "活动入场券", imageName: "tickets-icon",
        controller: UserTicketsViewController.initByName("User")),
    ],
    [
      Setting(title: "设置", imageName: "setting-icon", controller: nil)
    ],
  ]
}
