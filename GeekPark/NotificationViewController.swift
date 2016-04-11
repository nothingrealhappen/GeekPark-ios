//
//  NotificationViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/18/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  var notificationGroups = [NotificationGroup](){
    didSet{
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupNaviBar()
    NotificationGroup.list(){ notificationGroups in
      self.notificationGroups = notificationGroups
    }
  }
  
  func setupTableView(){
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  func setupNaviBar(){
    navigationItem.title = "消息"
  }
  
}

extension NotificationViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let controller = storyboard?.instantiateViewControllerWithIdentifier("NotificationsViewController") as! NotificationsViewController
    controller.notificationGroup = notificationGroups[indexPath.row]
    self.gct_pushAndHideTabbar(controller)
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 44+10+8+1
  }
}

extension NotificationViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notificationGroups.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("NotificationCell") as! NotificationCell
    cell.notificationGroup = notificationGroups[indexPath.row]
    if indexPath.row == notificationGroups.count - 1{
      cell.isLast = true
    }
    return cell
  }
  
}
