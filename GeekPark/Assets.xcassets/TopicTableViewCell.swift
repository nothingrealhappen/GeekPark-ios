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
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var publishTime: UILabel!
  @IBOutlet weak var descText: UILabel!
  func setData(topic: Topic){
    self.topic = topic
    updateUI()
  }
  
  func updateUI(){
    topicCover.kf_setImageWithURL(NSURL(string: topic?.cover?.file_url ?? "")!)
    title.text = topic?.title
    publishTime.text = topic?.publishedTime
    descText.text = topic?.descText
  }
}
