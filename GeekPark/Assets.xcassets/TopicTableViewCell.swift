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
  
  func setData(topic: Topic){
    self.topic = topic
    updateUI()
  }
  
  func updateUI(){
    topicCover.kf_setImageWithURL(NSURL(string: topic?.topicCover ?? "")!)
    describe.text = topic?.describe
    collectionTitle.text = topic?.collectionTitle
    describe.text = topic?.describe
    title.text = topic?.title
    authorName.text = topic?.authorName
    publishTime.text = topic?.publishTime
    commentCount.text = topic?.commentCount
  }
}
