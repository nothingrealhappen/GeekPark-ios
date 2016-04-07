//
//  ActivityIntroductionViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/31/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ActivityIntroductionViewController: DetailViewController {
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var introductionLabel: UILabel!
  var introduction: String = ""
  
  override func viewDidLoad() {
    introductionLabel.text = introduction
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: false)
    navigationController?.navigationBar.topItem?.title = "活动简介"
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewDidAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
}
