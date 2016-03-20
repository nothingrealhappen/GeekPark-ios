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
  
  var topics = [Topic]()
  var currentCollection: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}
