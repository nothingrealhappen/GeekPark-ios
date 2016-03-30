//
//  TopicTableViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/22/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class TopicTableViewCell: UITableViewCell {
  var topic: Topic?
  
  @IBOutlet weak var topicCover: UIImageView!
  @IBOutlet weak var collectionTitle: UILabel!
  @IBOutlet weak var describe: UILabel!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var authorName: UILabel!
  @IBOutlet weak var publishTime: UILabel!
  @IBOutlet weak var commentCount: UILabel!
  @IBOutlet weak var authorAvatar: UIImageView!
  
  func setData(topic: Topic){
    self.topic = topic
    updateUI()
  }
  
  func updateUI(){
    topicCover.kf_setImageWithURL(NSURL(string: topic?.cover?.file_url ?? "")!)
    describe.text = topic?.desc
    title.text = topic?.title
    authorName.text = topic?.author?.username
    publishTime.text = topic?.publishedTime
    commentCount.text = (topic?.comments_count ?? "0") + "条评论"
    authorAvatar.circlize()
    authorAvatar.kf_setImageWithURL(NSURL(string: topic?.author?.avatar ?? "")!)
  }
}
