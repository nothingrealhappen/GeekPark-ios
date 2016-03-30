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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    setupNaviBar()
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  func setupTableView(){
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  func setupNaviBar(){
    navigationController?.setNavigationBarHidden(false, animated: false)
    navigationController?.navigationBar.topItem?.title = "消息"
    let button  = UIButton(frame: CGRect(origin: CGPoint(x: 0,y:0), size: CGSize(width: Config.NavigationBar.iconWidth, height: Config.NavigationBar.iconWidth)))
    button.setImage(UIImage(named: "setting-icon"), forState: UIControlState.Normal)
    let rightButton = UIBarButtonItem(customView: button)
    navigationController?.navigationBar.topItem?.rightBarButtonItem = rightButton
  }
  
}

extension NotificationViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let controller = storyboard?.instantiateViewControllerWithIdentifier("NotificationsViewController") as! NotificationsViewController
    controller.type = indexPath.row%2 == 0 ? NotificationType.System : NotificationType.Activity
    navigationController?.pushViewController(controller, animated: true)
  }
  
}

extension NotificationViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("NotificationCell") as! NotificationCell
    cell.unreadCount = indexPath.row 
    return cell
  }
  
}
