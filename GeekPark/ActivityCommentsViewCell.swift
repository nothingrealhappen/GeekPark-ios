//
//  ActivityCommentsViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/26/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ActivityCommentsViewCell: ActivityBaseTableViewCell{
  
  @IBOutlet weak var commentsTable: UITableView!
  
  override func setData(data: Any) {
    commentsTable.delegate = self
    commentsTable.dataSource = self
  }
}

extension ActivityCommentsViewCell: UITableViewDataSource{
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = NSBundle.mainBundle().loadNibNamed("ActivityCommentViewCell", owner: self, options: nil).first as! ActivityCommentViewCell
    let data = ["userName": "极客君", "avatorUrl": "https://dn-geekpark-new.qbox.me/uploads/user/avatar/000/216/517/thumb_16a3a14a1bb1bdead60fada0593075ca.jpg", "content": "32个赞赞赞赞赞", "publishTime": "15分钟前"]
    cell.setData(data)
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 200
  }
}

extension ActivityCommentsViewCell: UITableViewDelegate{
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
  }
}