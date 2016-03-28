//
//  HeaderViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/24/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class HeaderViewCell: ActivityBaseTableViewCell{
  
  @IBOutlet weak var titleName: UILabel!
  
  override func setData(data: Any){
    let title = data as! String
    titleName.text = title
  }
}
