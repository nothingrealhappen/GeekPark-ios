//
//  NewsViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/18/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class TopicsPageViewController: UIViewController {
  
  @IBOutlet weak var ctitle: UILabel!
  @IBOutlet weak var topicsTable: UITableView!
  var changeTopLabelDelegate: ChangeTopLabelDelegate?
  
  var itemIndex = 0
  var topLoopTopic = [Topic(url: "https://dn-geekpark-new.qbox.me/uploads/image/file/f4/4f/f44f2dace0c7eacfb7b7da909764259d.jpg?imageView2/2/w/1270")]
  var topics = [Topic](){
    didSet{
      topicsTable.reloadData()
    }
  }
  var currentCollection: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    topicsTable.delegate = self
    ctitle.text = currentCollection
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    changeTopLabelDelegate?.changeTopLabel(itemIndex)
  }
  
}

extension TopicsPageViewController: UITableViewDelegate{
  
}

extension TopicsPageViewController: UITableViewDataSource{
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ImageLoopTableViewCell", forIndexPath: indexPath) as! ImageLoopTableViewCell
    cell.topics = topLoopTopic
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
}
