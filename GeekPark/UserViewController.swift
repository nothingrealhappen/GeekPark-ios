//
//  UserViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/18/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var settingGroups: [[Setting]] = Setting.userSettings
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }

  func setupViews(){
    self.navigationItem.title = "我的"
    
    tableView.dataSource = self
    tableView.delegate = self
  }
}

extension UserViewController: UITableViewDelegate{
  
  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 12
  }
  
  func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 0.0001
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    if indexPath.section == 0{
      return 80
    }else{
      return 50
    }
  }

}

extension UserViewController: UITableViewDataSource{
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return settingGroups.count
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return settingGroups[section].count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("UserCell") as! UserCell
    cell.isFirst = indexPath.section == 0
    cell.setting = settingGroups[indexPath.section][indexPath.row]
    return cell
  }
  
}
