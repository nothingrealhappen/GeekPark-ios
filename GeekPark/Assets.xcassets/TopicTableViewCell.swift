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
  func setData(topic: Topic){
    self.topic = topic
  }
}
