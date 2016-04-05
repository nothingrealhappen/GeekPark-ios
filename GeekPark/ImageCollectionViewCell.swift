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
  @IBOutlet weak var titleText: UILabel!
  
  var topic : Topic?{
    didSet{
      updateViews()
    }
  }
  
  func updateViews(){
    imageView.kf_setImageWithURL(NSURL(string: topic?.cover?.file_url ?? "")!)
    titleText.text = topic?.title
  }
  
}
