//
//  ActivityCell.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/23.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {
  
  @IBOutlet weak var status: UILabel!
  @IBOutlet weak var startAt: UILabel!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var bannerImg: UIImageView!
  
  var activity: Activity?{
    didSet{ updateViews() }
  }
  
  func updateViews(){
    status.text = activity?.statusText()
    status.backgroundColor = activity?.statusColor()
    title.text = activity?.title ?? "Title"
    startAt.text = NSDate.formateTimeFromTimeStamp((activity?.timestamp_start_at)!, formateString: "YYYY.MM.dd hh:mm")
  }
}
