//
//  ActivitySpeechesViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/25/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ActivitySpeechesViewCell: ActivityBaseTableViewCell{

  @IBOutlet weak var speechesTable: UITableView!
  
  var data = [["time": "09:00", "speechTitle": "来宾签到/暖场电影", "guests": []], ["time": "09:00", "speechTitle": "来宾签到/暖场电影", "guests": []]]
  
  override func setData(data: Any) {
    speechesTable.reloadData()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    speechesTable.delegate = self
    speechesTable.dataSource = self
  }
  
}

extension ActivitySpeechesViewCell: UITableViewDelegate{
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
  }
}

extension ActivitySpeechesViewCell: UITableViewDataSource{
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = NSBundle.mainBundle().loadNibNamed("ActivitySpeechViewCell", owner: self, options: nil).first as! ActivitySpeechViewCell
    cell.setData(data[indexPath.row])
    return cell
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 200
  }
  
  
}
