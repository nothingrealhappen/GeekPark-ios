//
//  ActivityBaseTableViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/24/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ActivityBaseTableViewCell: UITableViewCell {
  
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
