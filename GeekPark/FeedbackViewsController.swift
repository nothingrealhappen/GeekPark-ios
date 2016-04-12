//
//  FeedbackViewsController.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/12.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

class FeedbackViewsController: UIViewController {

  @IBOutlet weak var feedbackTextView: UITextView!
  @IBOutlet weak var emailField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNaviBar()
  }
  
  func setupNaviBar(){
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "发送", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(feedback))
  }
  
  func feedback(){
  }
  
}
