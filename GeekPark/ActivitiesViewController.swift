//
//  ActivitiesViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/18/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController, GRefreshable {

  
  @IBOutlet weak var tableView: UITableView!
  
  var page = 1
  
  var activities = [Activity](){
    didSet{ tableView.reloadData() }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.refreshableDelegate = self
    navigationController?.navigationBar.topItem?.title = "活动"
    loadData()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    tableView.addCntentOffSetObserver()
  }
  
  override func viewDidDisappear(animated: Bool) {
    super.viewDidDisappear(animated)
    tableView.removeContentOffSetObserver()
  }
  
  func pullRefresh() {
    self.activities = []
    page = 1
    loadData()
  }
  
  func loadMore() {
    page += 1
    loadData()
  }
  
  func loadData(){
    Activity.list(page) { activities in
      self.activities = self.activities + activities
      self.tableView.isLoading = false
    }
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
