//
//  NotificationCell.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/28.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

  @IBOutlet weak var timeText: UILabel!
  @IBOutlet weak var titleText: UILabel!
  @IBOutlet weak var contentText: UILabel!
  @IBOutlet weak var bagdeView: UILabel!
  @IBOutlet weak var separator: UIView!
  @IBOutlet weak var iconImg: UIImageView!
  
  var notificationGroup :NotificationGroup?{
    didSet{ updateViews() }
  }
  
  var isLast: Bool = false {
    didSet{
      separator.hidden = isLast
    }
  }
  
  func updateViews(){
    if notificationGroup?.unreadCount ?? 0 > 0 {
      bagdeView.text = "\(notificationGroup?.unreadCount ?? 0)"
      bagdeView.circlize()
    }else{
      bagdeView.removeFromSuperview()
    }
    titleText.text = notificationGroup?.title
    contentText.text = notificationGroup?.content
    timeText.text = NSDate(timeIntervalSince1970: Double(notificationGroup?.time ?? 0.0)).timeAgo
    iconImg.image = UIImage(named: notificationGroup?.imageName ?? "")
  }
}
