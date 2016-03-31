//
//  NewsViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/18/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class TopicsPageViewController: UIViewController {
  
  @IBOutlet weak var topicsTable: UITableView!
  var changeTopLabelDelegate: ChangeTopLabelDelegate?
  
  var itemIndex = 0
  var topLoopTopic = [Topic]()
  var page = 1
  var topics = [Topic](){
    didSet{
      topicsTable.reloadData()
      topLoopTopic = [topics[0],topics[1]]
    }
  }
  var currentCollection: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    topicsTable.delegate = self
    getTopics()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    changeTopLabelDelegate?.changeTopLabel(itemIndex)
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  func getTopics(){
    Topic.list(page,handler: self, collectionName: currentCollection!){ topics in
      self.topics = topics
    }
  }
  
  override func onDataRefresh() {
    getTopics()
  }
  
}

extension TopicsPageViewController: UITableViewDelegate{
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let topic = currentCollection == "全部" ? topics[indexPath.row - 1] : topics[indexPath.row]
    let controller = storyboard?.instantiateViewControllerWithIdentifier("TopicDetailViewController") as! TopicDetailViewController
    controller.topic = topic
    navigationController?.pushViewController(controller, animated: true)
  }
}

extension TopicsPageViewController: UITableViewDataSource{
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    if currentCollection == "全部" {
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
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard currentCollection == "全部" else { return topics.count }
    return topics.count + 1
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
}
