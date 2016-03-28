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
  var topics = [Topic](){
    didSet{
      topicsTable.reloadData()
    }
  }
  var currentCollection: String?
  
  //TODO
  override func viewDidLoad() {
    super.viewDidLoad()
    topicsTable.delegate = self
    if currentCollection == "全部"{
      topLoopTopic = [Topic(topCover: "https://dn-geekpark-new.qbox.me/uploads/image/file/a2/31/a231fcf76b59f7981d2082a36d06a359.jpg?imageView2/2/w/302"), Topic(topCover: "https://dn-geekpark-new.qbox.me/uploads/image/file/f4/4f/f44f2dace0c7eacfb7b7da909764259d.jpg?imageView2/2/w/302")]
    }
    for (var i = 0; i <= 10; i++){
      topics.append(Topic(describe: "在这个 iPhone SE 发布的日子，联想发布了一票ThinkPad X1 新品，其中包括了模块化平板 X1 Tablet。", title: "向传统说再见？ThinkPad 的这几款新品可能会出乎你的意料", authorName: "不像大爆炸的colorvc", collectionTitle: "极客之选", topicCover: "https://dn-geekpark-new.qbox.me/uploads/image/file/48/7f/487f9b4727e6b33b4cbf2e212788f381.jpg?imageView2/2/w/774", publishTime: "4分钟前", commentCount: "110条评论"))
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    changeTopLabelDelegate?.changeTopLabel(itemIndex)
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewWillAppear(animated)
  }
  
}

extension TopicsPageViewController: UITableViewDelegate{
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let topic = topics[indexPath.row]
    let controller = storyboard?.instantiateViewControllerWithIdentifier("TopicDetailViewController") as! TopicDetailViewController
    controller.topic = topic
    navigationController?.pushViewController(controller, animated: true)
    print(navigationController)
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
