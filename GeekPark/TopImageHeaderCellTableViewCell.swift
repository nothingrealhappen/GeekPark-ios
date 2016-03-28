//
//  TopImageHeaderCellTableViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/23/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class TopImageHeaderCell: ActivityBaseTableViewCell{
  @IBOutlet weak var topImage: UIImageView!
  
  override func setData(data: Any){
    let imgUrl = data as! String
    topImage.kf_setImageWithURL(NSURL(string: imgUrl)!)
  }
}
