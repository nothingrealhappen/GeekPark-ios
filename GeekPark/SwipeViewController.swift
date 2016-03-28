//
//  SwipeViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/25/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {
  var guesture: UIPanGestureRecognizer?

  override func viewDidLoad() {
    super.viewDidLoad()
    guesture = UIPanGestureRecognizer(target: self, action: ":handleSwipe")
  }
}

extension SwipeViewController: UIGestureRecognizerDelegate{
  func handleSwipe(recog: UIPanGestureRecognizer){
    let isLeft = recog.velocityInView(view).x < 0
    if isLeft{
      self.navigationController?.popViewControllerAnimated(true)
    }
  }
}
