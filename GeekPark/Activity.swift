//
//  Activity.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/21.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import Foundation

struct ActivityModel {
  let id: String
  let title: String
  let start_at: String
  let introduction: String
  let status :String
  let location :String?
  let banner: String?
}

class Activity: BaseModel{
  
  
  func list(page: Int,per: Int,callback: [ActivityModel]? -> ()){
    doRequest("activities", params: ["page","\(page)","per","\(per)"])
  }
  
}


