//
//  ActivityBaseTableViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/24/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

//用于view中调用它的controller的protocol
protocol ViewControllerDelegate{
  func callbackFromViewEvent()
}

class ActivityBaseTableViewCell: UITableViewCell {
  var viewControllerDelegate: ViewControllerDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.selectionStyle = .None
  }
  
  func setData(data: Any){
  }
  
  func getHeight() -> CGFloat?{
    return nil
  }
}
