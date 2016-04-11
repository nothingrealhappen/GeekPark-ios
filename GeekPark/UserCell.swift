//
//  UserCell.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/11.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
  
  @IBOutlet weak var iconImg: UIImageView!
  @IBOutlet weak var titleText: UILabel!
  @IBOutlet weak var iconHeight: NSLayoutConstraint!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.accessoryType = .DisclosureIndicator
  }
  
  var isFirst:Bool = false
  
  var setting: Setting?{
    didSet{ updateViews() }
  }
  
  func updateViews(){
    iconImg.image = UIImage(named: setting?.imageName ?? "")
    titleText.text = setting?.title
    iconHeight.constant = isFirst ? 48 : 30
  }
}
