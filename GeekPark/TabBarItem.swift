//
//  TabBarItem.swift
//  GeekPark
//
//  Created by 朱坤 on 3/17/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import Foundation

class MenuItem{
  var title: String?
  var image: String?
  var activeImage: String?
  var controllerName: String?
  
  init(title: String, image: String, activeImage: String, controllerName: String){
    self.title = title
    self.image = image
    self.activeImage = activeImage
    self.controllerName = controllerName
  }
}
