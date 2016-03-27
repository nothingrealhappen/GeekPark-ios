//
//  ActivitySpeechGuestViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/25/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ActivitySpeechGuestViewCell: ActivityBaseTableViewCell{

  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var guestTitle: UILabel!
  
  override func setData(data: Any) {
    
    var dic = data as! Dictionary<String, String>
    dic = ["name": "朱坤", "guestTitle": "极客公园"]
    name.text = dic["name"]
    guestTitle.text = dic["guestTitle"]
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

}
