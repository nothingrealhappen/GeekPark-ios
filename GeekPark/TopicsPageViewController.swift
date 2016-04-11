//
//  NewsViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/18/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class TopicsPageViewController: UIViewController, GRefreshable {
  
  @IBOutlet weak var topicsTable: UITableView!
  var changeTopLabelDelegate: ChangeTopLabelDelegate?
  
  var itemIndex = 0
  var topLoopTopic = [Topic](){ didSet{ topicsTable.reloadData() } }
  var page = 1
  var topics = [Topic](){
    didSet{
      topicsTable.reloadData()
    }
  }
  var currentCollection: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    topicsTable.delegate = self
    topicsTable.refreshableDelegate = self
    getTopics()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    changeTopLabelDelegate?.changeTopLabel(itemIndex)
  }
  
  
  func getTopics(){
    Topic.list(page,handler: self, collectionName: currentCollection!){ topics in
      self.topics = self.topics + topics
      self.topicsTable.isLoading = false
    }
    if itemIndex == 0{
      Topic.top() { topics in
        self.topLoopTopic = topics
      }
    }
  }
  
  override func onDataRefresh() {
    pullRefresh()
  }
  
  func pullRefresh() {
    page = 1
    topics = []
    getTopics()
  }
  
  func loadMore() {
    page += 1
    getTopics()
  }
  
  deinit{
    topicsTable.removeContentOffSetObserver()
  }
  
}

extension TopicsPageViewController: UITableViewDelegate{
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    let topic = itemIndex == 0 ? topics[indexPath.row - 1] : topics[indexPath.row]
    let controller = storyboard?.instantiateViewControllerWithIdentifier("TopicDetailViewController") as! TopicDetailViewController
    controller.topic = topic
    self.gct_pushAndHideTabbar(controller)
  }
}

extension TopicsPageViewController: UITableViewDataSource{
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    if itemIndex == 0{
      if indexPath.row == 0{
        let cell = tableView.dequeueReusableCellWithIdentifier("ImageLoopTableViewCell", forIndexPath: indexPath) as! ImageLoopTableViewCell
        cell.setData(topLoopTopic)
        return cell
      } else {
        let cell = tableView.dequeueReusableCellWithIdentifier("TopicTableViewCell") as! TopicTableViewCell
        cell.setData(topics[indexPath.row-1])
        return cell
      }
    } else {
      let cell = tableView.dequeueReusableCellWithIdentifier("TopicTableViewCell") as! TopicTableViewCell
      cell.setData(topics[indexPath.row])
      return cell
    }
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    if itemIndex == 0 && indexPath.row == 0{
      return 210
    }else{
      return UIScreen.mainScreen().bounds.width * 160 / 750 + 31
    }
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard currentCollection == "全部" else { return topics.count }
    return topics.count + 1
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
}
