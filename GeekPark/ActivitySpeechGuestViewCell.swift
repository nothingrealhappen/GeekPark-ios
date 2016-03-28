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
  var guest = Guest()
  
  override func setData(data: Any) {
    guest = data as! Guest
    name.text = guest.name
    guestTitle.text = guest.title
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

}
