//
//  NotificationsViewController.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/28.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    onDataEmpty()
  }
  
  func setupViews(){
    navigationItem.title = "系统通知"
  }
  
}
