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
  
  var speech = Speech()
  
  override func setData(data: Any){
    self.speech = data as! Speech
    time.text = NSDate.formateTimeFromTimeStamp(speech.timestamp_start_at, formateString: "hh:mm")
    speechTitle.text = speech.title
    guestTable.delegate = self
    guestTable.dataSource = self
    guestTable.scrollEnabled = false
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func getHeight() -> CGFloat? {
    return CGFloat(speech.guests.count * 66 + 25)
  }

}

extension ActivitySpeechViewCell: UITableViewDelegate{
  
}

extension ActivitySpeechViewCell: UITableViewDataSource{
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return speech.guests.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = NSBundle.mainBundle().loadNibNamed("ActivitySpeechGuestViewCell", owner: self, options: nil).first as! ActivitySpeechGuestViewCell
    cell.setData(speech.guests[indexPath.row])
    return cell
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 66
  }
}
