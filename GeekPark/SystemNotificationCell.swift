//
//  SystemNotificationCell.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/29.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

class SystemNotificationCell: NotificationBaseCell {
  
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var contentText: UILabel!
  @IBOutlet weak var titleText: UILabel!
  @IBOutlet weak var moreText: UILabel!
  @IBOutlet weak var dateText: UILabel!
  
  
  override func updateViews(){
    titleText.text = notification?.title
    contentText.text = notification?.content
    dateText.text = notification?.date
  }
}
