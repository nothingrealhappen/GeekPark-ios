//
//  ActivityCommentsViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/26/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ActivityCommentsViewCell: ActivityBaseTableViewCell{
  
  var commentsView: CommentsView?
  var cellHeight: CGFloat = 50
  var comments = [Comment]()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    commentsView = NSBundle.mainBundle().loadNibNamed("CommentsView", owner: self, options: nil)[0] as? CommentsView
    commentsView!.frame.size = self.frame.size
    self.addSubview(commentsView!)
  }
  
  override func setData(comments: Any) {
    self.comments = comments as! [Comment]
    self.commentsView?.comments = self.comments
  }
  
  func getHeightAndReloadTable(comments: [Comment]) -> CGFloat{
    let height: CGFloat = comments.reduce(0){ sum, comment in
      let tmpHeight = comment.body!.boundingRectWithSize(CGSize(width:UIScreen.mainScreen().bounds.width-40, height: CGFloat(DBL_MAX)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont(name: "HelveticaNeue-UltraLight",
        size: 17.0)! , NSForegroundColorAttributeName: UIColor.redColor()], context: nil).height
      return sum + tmpHeight + 83
    }
    return height
  }
  
  override func getHeight() -> CGFloat? {
    return getHeightAndReloadTable(comments)
  }
}