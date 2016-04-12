//
//  Config.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/28.
//  Copyright © 2016年 GeekPark. All rights reserved.

import UIKit

struct Config {
  struct NavigationBar {
    static let iconWidth = 25
  }
  
  struct Color{
    static let hightlightColor = UIColor(rgba: "#145FF3")
    static let normalColor = UIColor(rgba: "#A9A9A9")
    static let ticketUsedColor = UIColor(rgba: "#A0A0A0")
    static let ticketNormalColor = Config.Color.hightlightColor
  }
  
  static let BaseUrl = "http://events.geekpark.net"
  
}
