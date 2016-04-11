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
  var ancestry = ""
  static let names = ["R2-D2", "C-3PO", "BB-8"]
  
  static func list(commentType: String, commentable_id: String, callback: ([Comment]) -> Void){
    doRequest(router: "comments", api_root: main_api_root, params: ["commentable_type": commentType, "commentable_id": commentable_id]){ status, data in
      if status == .SUCCESS{
        var comments = [Comment](json: data!.rawString())
        comments = Comment.sort(comments)
        comments = Comment.handleAnonymous(comments)
        comments = Comment.handleCommentInherit(comments)
        callback(comments)
      } else {
      }
    }
  }
  
  static func sort(comments: [Comment]) -> [Comment]{
    return comments.sort(){ comment1, comment2 in
      return comment1.ancestry < comment2.ancestry
    }
  }
  
  static func handleAnonymous(comments: [Comment]) -> [Comment]{
    return comments.map{ comment in
      if comment.user == nil{
        comment.user = User(json: "{\"username\": \"\(getRandomName())\"}")
        print(comment.user)
      }
      return comment
    }
  }
  
  static func handleCommentInherit(comments: [Comment]) -> [Comment]{
    return comments.map{ comment in
      if comment.parent_id != ""{
        if let parent = find_by_id(comment.parent_id, comments: comments){
          comment.body = "回复 \(parent.user?.username ?? ""): " + (comment.body ?? "")
        }
      }
      return comment
    }
  }
  
  static func find_by_id(id: String, comments: [Comment]) -> Comment?{
    for comment in comments {
      if comment.id == id{ return comment }
    }
    return nil
  }
  
  static func getRandom() -> UInt32{
    return arc4random()
  }
  
  static func getRandomAvator() -> String{
    return "\(getRandom()%8)"
  }
  
  static func getRandomName() -> String{
    let index = Int(getRandom()%3)
    return names[index]
  }

}