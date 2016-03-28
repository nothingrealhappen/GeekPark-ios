//
//  ActivitySpeechViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/25/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ActivitySpeechViewCell: ActivityBaseTableViewCell{

  @IBOutlet weak var time: UILabel!
  @IBOutlet weak var speechTitle: UILabel!
  @IBOutlet weak var guestTable: UITableView!
  
  var dicData: Dictionary<String, NSObject>!
  
  override func setData(data: Any){
    let dicData = data as! Dictionary<String, NSObject>
    time.text = dicData["time"] as? String
    speechTitle.text = dicData["speechTitle"] as? String
    guestTable.delegate = self
    guestTable.dataSource = self
    guestTable.scrollEnabled = false
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

}

extension ActivitySpeechViewCell: UITableViewDelegate{
  
}

extension ActivitySpeechViewCell: UITableViewDataSource{
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = NSBundle.mainBundle().loadNibNamed("ActivitySpeechGuestViewCell", owner: self, options: nil).first as! ActivitySpeechGuestViewCell
    cell.setData(["title": "test", "name": "mada"])
    return cell
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 60
  }
}
