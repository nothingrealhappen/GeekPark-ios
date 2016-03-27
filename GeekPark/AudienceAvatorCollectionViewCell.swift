//
//  AudienceAvatorCollectionViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/25/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class AudienceAvatorCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var avatorImage: UIImageView!
  func setUrl(str: String){
    avatorImage.kf_setImageWithURL(NSURL(string: str)!)
    avatorImage.circlize()
  }
}
