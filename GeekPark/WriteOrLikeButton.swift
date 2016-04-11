//
//  wirteOrLikeButton.swift
//  GeekPark
//
//  Created by 朱坤 on 4/8/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class WriteOrLikeButton: UIButton {
  var style: buttonStyle = .write
  
  override var highlighted: Bool{
    didSet{
      if style == .write{
        if highlighted {
          self.tintColor = Config.Color.hightlightColor
        } else {
          self.tintColor = Config.Color.normalColor
        }
      } else {
        if highlighted{
          UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.transform = CGAffineTransformMakeScale(1.2, 1.2)
            self.tintColor = UIColor.redColor()
          }, completion: nil)
        } else {
          UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.transform = CGAffineTransformMakeScale(1.0, 1.0)
            self.tintColor = Config.Color.normalColor
          }, completion: nil)
        }
      }
    }
  }
  
}
