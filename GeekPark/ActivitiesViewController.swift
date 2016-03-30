//
//  ActivitiesViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/18/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {

  
  @IBOutlet weak var tableView: UITableView!
  
  var page = 1
  
  var activities = [Activity](){
    didSet{ tableView.reloadData() }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    Activity.list(page) { activities in
      self.activities = activities
    }
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: false)
    navigationController?.navigationBar.topItem?.title = "活动"
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
}

extension ActivitiesViewController: UITableViewDelegate{
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let controller = storyboard?.instantiateViewControllerWithIdentifier("ActivityDetailViewController") as! ActivityDetailViewController
    controller.activity_id = activities[indexPath.row].id
    navigationController?.pushViewController(controller, animated: true)
  }
}

extension ActivitiesViewController: UITableViewDataSource{
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    indexPath.section
    let cell = tableView.dequeueReusableCellWithIdentifier("ActivityCell") as! ActivityCell
    cell.activity = activities[indexPath.row]
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return activities.count
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
}
