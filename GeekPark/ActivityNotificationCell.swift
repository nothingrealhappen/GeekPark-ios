//
//  ActivityNotificationCell.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/29.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit
class ActivityNotificationCell: NotificationBaseCell{
  
  
  @IBOutlet weak var moreText: UILabel!
  @IBOutlet weak var bannerImg: UIImageView!
  @IBOutlet weak var titleText: UILabel!
  @IBOutlet weak var dateText: UILabel!
  
  override func updateViews() {
    titleText.text = notification?.title
    dateText.text = notification?.date
    moreText.text = "查看详情"
  }
  
}
