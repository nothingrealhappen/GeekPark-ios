//
//  SettingCell.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/12.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {
  
  @IBOutlet weak var titleText: UILabel!
  @IBOutlet weak var statusText: UILabel!
  @IBOutlet weak var settingSwitch: UISwitch!
  
  var setting: Setting?{ didSet{ updateViews() } }
  
  func updateViews(){
    titleText.text = setting?.title
    if !(setting?.hasSwitch ?? false ){
      settingSwitch.removeFromSuperview()
    }
    statusText.text = setting?.extra
    self.accessoryType = (setting?.hasIndicator ?? false ) ? .DisclosureIndicator : .None
    titleText.textAlignment = (setting?.titleCenter ?? false) ? .Center : .Left
    titleText.setNeedsLayout()
  }

}
