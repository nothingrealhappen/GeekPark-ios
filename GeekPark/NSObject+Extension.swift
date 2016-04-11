//
//  NSObject+Extension.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/11.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import Foundation
extension NSObject {
  class var nameOfClass: String {
    return NSStringFromClass(self).componentsSeparatedByString(".").last! as String
  }
}
