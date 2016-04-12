//
//  ActivityViewController.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/11.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

class ActivityContainnerViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let vc = ActivitiesViewController.initByName("Activity")
    self.title = "活动"
    view.addSubview(vc.view)
    addChildViewController(vc)
  }
  
}
