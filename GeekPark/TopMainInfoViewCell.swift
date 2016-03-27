//
//  TopMainInfoViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/23/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

enum LineStatus{
  case Normal
  case Last
}

class TopMainInfoViewCell: ActivityBaseTableViewCell{
  
  @IBOutlet weak var value: UILabel!
  @IBOutlet weak var mainTitle: UILabel!
  @IBOutlet weak var buttomLine: UIView!
  var lineStatus: LineStatus = .Normal
  
  override func setData(data: Any){
    let dic = data as! Dictionary<String, String>
    self.value.text = dic["value"]
    self.mainTitle.text = dic["title"]
    if lineStatus == .Last {
      buttomLine?.removeFromSuperview()
    }
  }
}
