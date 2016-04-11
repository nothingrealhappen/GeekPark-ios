//
//  NavigationBar+Extension.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/11.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

extension UINavigationBar{
  
  class func setupStyle(){
    let navBar = UINavigationBar.appearance()
    
    navBar.translucent = false
    navBar.barTintColor = UIColor.whiteColor()
  }
  
}