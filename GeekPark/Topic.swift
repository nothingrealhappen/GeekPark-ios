//
//  Topic.swift
//  GeekPark
//
//  Created by 朱坤 on 3/20/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import Foundation

class Topic:BaseModel{
  
  var id: Int = 0
  var title: String?
  var desc: String?
  var comments_count:String?
  var published_at: Int = 0
  var body: String?
  var author: User?
  var cover: GImage?
  var comments: [Comment]?
  
  
  var publishedTime :String?{
    get { return NSDate(timeIntervalSince1970: Double(self.published_at)).timeAgo }
  }
  
  static func list(page: Int,handler: GDataHandler, collectionName: String,callback: ([Topic]->())){
    doRequest(router: "collection/find_by_name/topics",
              params: ["page":page,"keyword":collectionName],
              api_root: BaseModel.main_api_root,
              dataHandler: handler
    ) { result in
        let topics = [Topic](json: result!.rawString())
        callback(topics)
    }
  }
  
  static func top(callback: ([Topic]-> ())){
    doRequest(router: "topics/top",api_root: BaseModel.main_api_root){ status,result in
      if status == .SUCCESS {
        let topics = [Topic](json: result!.rawString())
        callback(topics)
      }
    }
  }
  
  static func findById(id: Int?,handler: GDataHandler,callback: (Topic? ->())){
    guard let id = id else { handler.onDataEmpty() ;return}
    doRequest(router: "topics/\(id)",
              api_root: BaseModel.main_api_root,
              dataHandler: handler){ result in
      let topic = Topic(json: result?.rawString())
      callback(topic)
    }
  }
}