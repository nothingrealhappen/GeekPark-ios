//
//  Comment.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/30.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import Foundation
class Comment: BaseModel{
  var id: Int = 0
  var body: String?
  var created_at: String?
  var depth: Int = 0
  var parent_id: Int = 0
  var user :User?
  
}