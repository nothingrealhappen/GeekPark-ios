//
//  CommentsView.swift
//  GeekPark
//
//  Created by 朱坤 on 4/6/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

//用于打开评论输入框
protocol ReCommentDelegate {
  func openCommentTextField()
}

class CommentsView: UIView {
  @IBOutlet weak var commentsTable: UITableView!
  var commentDelegate: ReCommentDelegate?
  var comments = [Comment](){
    didSet{
      commentsTable.reloadData()
    }
  }
  
  override func willMoveToSuperview(newSuperview: UIView?) {
    super.willMoveToSuperview(newSuperview)
    commentsTable.delegate = self
    commentsTable.dataSource = self
    commentsTable.estimatedRowHeight = 50
    commentsTable.rowHeight = UITableViewAutomaticDimension
  }
}

extension CommentsView: UITableViewDelegate{
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
}

extension CommentsView: UITableViewDataSource {
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    if comments.count == 0{
      return NSBundle.mainBundle().loadNibNamed("CommentsView", owner: self, options: nil)[2] as! UITableViewCell
    }
    let cell = NSBundle.mainBundle().loadNibNamed("CommentsView", owner: self, options: nil)[1] as! CommentViewCell
    cell.setData(comments[indexPath.row])
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if comments.count == 0{
      return 1
    }
    return comments.count
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
}