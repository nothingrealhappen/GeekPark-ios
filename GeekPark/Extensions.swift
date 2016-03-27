//
//  Extensions.swift
//  GeekPark
//
//  Created by 朱坤 on 3/25/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

extension UIImageView {
  func circlize(){
    self.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: bounds.width, height: bounds.height))
    contentMode = UIViewContentMode.ScaleAspectFill
    layer.cornerRadius = bounds.height / 2
    clipsToBounds = true
  }
  
}