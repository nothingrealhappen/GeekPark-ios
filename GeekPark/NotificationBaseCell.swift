//
//  NotificationBaseCell.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/29.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

class NotificationBaseCell: UITableViewCell {
  
  var notification: Notification? {
    didSet{ updateViews() }
  }
  
  func updateViews(){
  }
  
}
