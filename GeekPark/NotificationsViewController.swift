//
//  NotificationsViewController.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/28.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit
class NotificationsViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var type: NotificationType = .System
  var notifications = [Notification]() {
    didSet{ tableView.reloadData() }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  func setupViews(){
    navigationItem.title = type == .System ? "系统通知" : "活动推广"
    setupTable()
  }
  
  func setupTable(){
    tableView.dataSource = self
    tableView.delegate = self
    Notification.list(type){ notifications in
      self.notifications = notifications
    }
  }
  
}

extension NotificationsViewController: UITableViewDelegate{
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return type == .System ? 150 : 250
  }
  
}

extension NotificationsViewController: UITableViewDataSource{
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notifications.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let notification = notifications[indexPath.row]
    let cell = tableView.dequeueReusableCellWithIdentifier(notification.cellType) as! NotificationBaseCell
    cell.notification = notification
    return cell
  }
}
