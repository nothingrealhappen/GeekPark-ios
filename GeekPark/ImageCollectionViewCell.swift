//
//  InfiniteImageCollectionViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/21/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit
import Kingfisher

class ImageCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var imageView: UIImageView!
  
  func setImageUrl(url: String){
    imageView.kf_setImageWithURL(NSURL(string: url)!)
  }
  
}
