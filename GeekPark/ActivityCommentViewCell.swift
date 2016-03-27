//
//  ActivityCommentViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/25/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//
import UIKit

class ActivityCommentViewCell: ActivityBaseTableViewCell{
  
  @IBOutlet weak var avatorImage: UIImageView!
  @IBOutlet weak var publishTime: UILabel!
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var content: UILabel!
  @IBOutlet weak var commentsOfCommentTable: UITableView!
  
  var data = []
  
  override func setData(data: Any) {
    commentsOfCommentTable.delegate = self
    commentsOfCommentTable.dataSource = self
    let dic = data as! Dictionary<String, String>
    avatorImage.kf_setImageWithURL(NSURL(string: dic["avatorUrl"]!)!)
    publishTime.text = dic["publishTime"]
    userName.text = dic["userName"]
    content.text = dic["content"]
  }
}

extension ActivityCommentViewCell: UITableViewDataSource{
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = NSBundle.mainBundle().loadNibNamed("ActivityCommentsOfCommentViewCell", owner: self, options: nil).first as! ActivityCommentsOfCommentViewCell
    let data = ["avatorUrl": "https://dn-geekpark-new.qbox.me/uploads/user/avatar/000/216/517/thumb_16a3a14a1bb1bdead60fada0593075ca.jpg", "publishTime": "1分钟前", "userName": "极客君", "content": "好活动"]
    cell.setData(data)
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 100
  }
}

extension ActivityCommentViewCell: UITableViewDelegate{
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
  }
}

