//
//  NotificationCell.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/28.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

  @IBOutlet weak var iconImgBorder: UIImageView!
  @IBOutlet weak var timeText: UILabel!
  @IBOutlet weak var titleText: UILabel!
  @IBOutlet weak var contentText: UILabel!
  @IBOutlet weak var bagdeView: UILabel!
  @IBOutlet weak var separator: UIView!
  @IBOutlet weak var iconImg: UIImageView!
  
  var unreadCount :Int? {
    didSet{ updateViews() }
  }
  
  func updateViews(){
    iconImgBorder.circlizeWithBorder()
    if unreadCount ?? 0 > 0 {
      bagdeView.text = "\(unreadCount!)"
      bagdeView.circlize()
    }else{
      bagdeView.removeFromSuperview()
    }
  }
  
  
}
