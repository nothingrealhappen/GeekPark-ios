//
//  ActivityDescribeViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/24/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ActivityDescribeViewCell: ActivityBaseTableViewCell{
  @IBOutlet weak var openButton: BaseButton!
  @IBOutlet weak var describeLabel: UILabel!
  var changeHeightDelegate: ChangeDetailHeightDelegate?
  
  override func willMoveToWindow(newWindow: UIWindow?) {
    super.willMoveToWindow(newWindow)
    if getDescribeHeight() < 200 {
      openButton?.removeFromSuperview()
    }
  }
  
  @IBAction func openDetailButton() {
    changeHeightDelegate?.updateHeight()
  }
  
  override func setData(data: Any){
    let describe = data as! String
    describeLabel.text = describe
  }
  
  override func getHeight() -> CGFloat? {
    var height = getDescribeHeight()
    if height > 200 {
      height = 200
    } else {
      height = height + 5
    }
    return height
  }
  
  func getDescribeHeight() -> CGFloat {
    describeLabel.frame.size = CGSize(width: UIScreen.mainScreen().bounds.width-10, height: CGFloat(DBL_MAX))
    describeLabel.sizeToFit()
    return describeLabel.frame.height
  }
  
}
