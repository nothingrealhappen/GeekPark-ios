//
//  ActivityDescribeViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/24/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ActivityDescribeViewCell: ActivityBaseTableViewCell{
  @IBOutlet weak var openLable: UILabel!
  @IBOutlet weak var describeLabel: UILabel!
  
  override func setData(data: Any){
    let describe = data as! String
    describeLabel.text = describe
  }
}