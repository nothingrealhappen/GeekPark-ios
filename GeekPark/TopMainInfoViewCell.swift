//
//  TopMainInfoViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/23/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

enum LineStatus {
  case Normal
  case Last
}

class TopMainInfoViewCell: ActivityBaseTableViewCell {
  
  @IBOutlet weak var value: UILabel!
  @IBOutlet weak var icon: UIImageView!
  @IBOutlet weak var buttomLine: UIView!
  @IBOutlet weak var statusView: UIView!
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var arrowView: UIImageView!
  
  var lineStatus: LineStatus = .Normal
  
  override func setData(data: Any) {
    let dic = data as! Dictionary<String, String>
    value.text = dic["value"]
    icon.image = UIImage(named: dic["image"] ?? "")
    if lineStatus == .Last {
      buttomLine?.removeFromSuperview()
    }
    
    if let status = dic["status"] {
      statusView.backgroundColor = Activity.statusColorMap[status]
      statusLabel.text = Activity.statusMap[status]
      arrowView.hidden = true
      return
    }
    
    if let _ = dic["arrow"] {
      statusView.hidden = true
      return
    }
    
    arrowView.hidden = true
    statusView.hidden = true
  }
  
}
