//
//  Topic.swift
//  GeekPark
//
//  Created by 朱坤 on 3/20/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import Foundation

class Topic{
  var describe: String?
  var title: String?
  var authorName: String?
  var collectionTitle: String?
  var topicCover: String?
  var publishTime: String?
  var commentCount: String?
  var topCover: String?
  init(topCover: String){
    self.topCover = topCover
  }
  
  init(describe: String, title: String, authorName: String, collectionTitle: String, topicCover: String, publishTime: String, commentCount: String){
    self.topicCover = topicCover
    self.describe = describe
    self.title = title
    self.authorName = authorName
    self.collectionTitle = collectionTitle
    self.topicCover = topicCover
    self.publishTime = publishTime
    self.commentCount = commentCount
  }
}