//
//  FullScreenViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/25/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class FullScreenViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.edgesForExtendedLayout = UIRectEdge.None;
    self.extendedLayoutIncludesOpaqueBars = false
    self.automaticallyAdjustsScrollViewInsets = false
  }

}
