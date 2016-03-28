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
  var speeches = [Speech]()
  
  override func setData(data: Any) {
    speeches = data as! [Speech]
    speechesTable.reloadData()
  }
  
  override func getHeight() -> CGFloat? {
    var height = CGFloat(speeches.count * 25)
    height = speeches.reduce(height){ sum, speech in
      return sum + CGFloat(speech.guests.count * 66)
    }
    return height
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
    return speeches.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = NSBundle.mainBundle().loadNibNamed("ActivitySpeechViewCell", owner: self, options: nil).first as! ActivitySpeechViewCell
    cell.setData(speeches[indexPath.row])
    return cell
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    let cell = NSBundle.mainBundle().loadNibNamed("ActivitySpeechViewCell", owner: self, options: nil).first as! ActivitySpeechViewCell
    cell.setData(speeches[indexPath.row])
    return (cell.getHeight() ?? cell.frame.height)
  }
  
  
}
