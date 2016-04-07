//
//  Comment.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/30.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import Foundation

class Comment: BaseModel{
  var id = ""
  var body: String?
  var created_at: String?
  var depth: Int = 0
  var parent_id = ""
  var user: User?
  
  static func list(commentType: String, commentable_id: String, callback: ([Comment]) -> Void){
    doRequest(router: "comments", api_root: main_api_root, params: ["commentable_type": commentType, "commentable_id": commentable_id]){ status, data in
      if status == .SUCCESS{
        let comments = [Comment](json: data!.rawString())
        callback(comments)
      } else {
      }
    }
  }
}