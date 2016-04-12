//
//  CommentViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 4/6/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class CommentViewCell: UITableViewCell {

  var comment: Comment?
  @IBOutlet weak var avator: UIImageView!
  @IBOutlet weak var content: UILabel!
  @IBOutlet weak var publishTime: UILabel!
  @IBOutlet weak var username: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setData(comment: Comment){
    self.comment = comment
    avator.kf_setImageWithURL(NSURL(string: comment.user?.avatar ?? "")!, placeholderImage: UIImage(named: Comment.getRandomAvator()))
    avator.circlize()
    content.text = comment.body
    content.setTextColor(UIColor(rgba: "#6e6e6e"), after: "回复 ", before: ": ")
    publishTime.text = NSDate.timeAgoFromDataSource(comment.created_at ?? "")?.timeAgo
    username.text = comment.user?.username ?? ""
  }
  
}
