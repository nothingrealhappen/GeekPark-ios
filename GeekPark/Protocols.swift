//
//  Protocols.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/29.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import Foundation

protocol CircleAble {
  func circlize()
  func circlizeWithBorder()
}

protocol GDataHandler {
  func onDataEmpty()
  func onDataError()
  func onDataRefresh()
}