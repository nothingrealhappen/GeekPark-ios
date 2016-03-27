//
//  ActivityCommentsOfCommentViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/26/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ActivityCommentsOfCommentViewCell: ActivityBaseTableViewCell{
  @IBOutlet weak var avatorImage: UIImageView!
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var content: UILabel!
  @IBOutlet weak var publishTime: UILabel!
  
  override func setData(data: Any) {
    let dic = data as! Dictionary<String, String>
    avatorImage.kf_setImageWithURL(NSURL(string: dic["avatorUrl"] ?? "")!)
    userName.text = dic["usernName"]
    content.text = dic["content"]
    publishTime.text = dic["publishTime"]
  }
}