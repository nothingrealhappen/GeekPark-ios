//
//  BaseButton.swift
//  GeekPark
//
//  Created by 朱坤 on 3/30/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class BaseButton: UIButton{
  override var highlighted: Bool{
    didSet{
      if (highlighted){
        self.alpha = 0.9
      } else {
        self.alpha = 1
      }
    }
  }
}