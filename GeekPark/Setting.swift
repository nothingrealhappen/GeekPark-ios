//
//  Setting.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/11.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

class Setting{
  
  typealias ActionHandler = () -> ()
  
  var imageName: String?
  var title: String = ""
  var controller: UIViewController?
  var hasSwitch: Bool = false
  var hasIndicator: Bool = false
  var extra: String?
  var titleCenter: Bool = false
  var handler: ActionHandler?
  
  
  init(title: String,
       imageName: String? = nil,
       controller: UIViewController? = nil,
       hasSwitch: Bool = false,
       extra: String = "",
       hasIndicator: Bool = false,
       titleCenter: Bool = false,
       handler: ActionHandler = {}
    ){
    self.title = title
    self.imageName = imageName
    self.controller = controller
    self.hasSwitch = hasSwitch
    self.extra = extra
    self.hasIndicator = hasIndicator
    self.titleCenter = titleCenter
    self.handler = handler
  }
  
  
  static let userSettings = [
    [
      Setting(title: "登录/注册", imageName: "robot-icon")
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
      Setting(title: "设置", imageName: "setting-icon",
        controller: SettingsViewController.initByName("User"))
    ],
  ]
  
  static let settingItems = [
    [
      Setting(title: "接收消息通知",extra: "已关闭")
    ],
    [
      Setting(title: "系统通知",hasSwitch: true),
      Setting(title: "活动推送",hasSwitch: true),
      Setting(title: "评论回复",hasSwitch: true),
    ],
    [
      Setting(title: "关于我们", hasIndicator: true ),
      Setting(title: "去Apple Store评价", hasIndicator: true),
      Setting(title: "意见反馈", hasIndicator: true),
      Setting(title: "欢迎页", hasIndicator: true , handler: { LaunchView.showAtWindow(force: true) }),
      Setting(title: "清除缓存", hasIndicator: true),
    ],
    [
      Setting(title: "退出登录", titleCenter: true)
    ]
  ]
}
