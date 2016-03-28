//
//  ActivityDetailViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/23/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ActivityDetailViewController: FullScreenViewController {

  var activity_id = ""
  var activity: Activity?
  @IBOutlet weak var containerTable: UITableView!
  let cellIdentify = ["TopMainInfoViewCell", "ActivityDescribeViewCell", "ActivitySpeechesViewCell",  "ActivityJoinedAudienceViewCell", "ActivityCommentsViewCell"]
  
  //TODO
  var datas: [NSArray] = [[["title": "活动", "value": "未来头条"], ["title": "活动", "value": "未来头条"], ["title": "活动", "value": "未来头条"]], [""], [[["time": "09:00", "speechTitle": "90赫兹和VR"], ["time": "10:00", "speechTitle": "90赫兹与VR现状"]]], [["https://dn-geekpark-new.qbox.me/uploads/user/avatar/000/216/517/thumb_16a3a14a1bb1bdead60fada0593075ca.jpg", "https://dn-geekpark-new.qbox.me/uploads/user/avatar/000/216/517/thumb_16a3a14a1bb1bdead60fada0593075ca.jpg"]], [[]]]{
    didSet{
      containerTable.reloadData()
    }
  }
  var headerDatas: [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    containerTable.delegate = self
    containerTable.dataSource = self
    
    Activity.speeches(activity_id){ activity in
      self.activity = activity
      self.headerDatas = ["https://dn-geekpark-new.qbox.me/uploads/image/file/72/29/722962955a200ffc1f64209068635d46.jpg", "活动简介", "活动日程", "报名用户", "用户评论"]
      self.datas = [activity.infoDictionary(), [activity.introduction ?? ""], [activity.speeches ?? []], [["https://dn-geekpark-new.qbox.me/uploads/user/avatar/000/216/517/thumb_16a3a14a1bb1bdead60fada0593075ca.jpg", "https://dn-geekpark-new.qbox.me/uploads/user/avatar/000/216/517/thumb_16a3a14a1bb1bdead60fada0593075ca.jpg"]], [[]]]
    }
    
    //让table滚动时header不为float
    let height: CGFloat = 230
    let view = UIView(frame: CGRect(x: 0, y: 0, width: containerTable.frame.width, height: height))
    containerTable.tableHeaderView = view
    containerTable.contentInset = UIEdgeInsetsMake(-height, 0, 0, 0)
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
  }
}

extension ActivityDetailViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
  }
}

extension ActivityDetailViewController: UITableViewDataSource {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return headerDatas.count
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return datas[section].count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let identify = cellIdentify[indexPath.section]
    let cell = tableView.dequeueReusableCellWithIdentifier(identify) as! ActivityBaseTableViewCell
    let data = datas[indexPath.section][indexPath.row]
    
    //当为最后一个时删掉下划线
    if identify == "TopMainInfoViewCell" && indexPath.row == datas[0].count-1 {
      let removeButtomLine = cell as! TopMainInfoViewCell
      removeButtomLine.lineStatus = .Last
    }
    cell.setData(data)
    return cell
  }
  
  func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let identify = section == 0 ? "TopImageHeaderCell" : "HeaderViewCell"
    let data: Any = headerDatas[section]
    let cell = tableView.dequeueReusableCellWithIdentifier(identify) as! ActivityBaseTableViewCell
    cell.setData(data)
    cell.sizeToFit()
    return cell
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    let identify = cellIdentify[indexPath.section]
    let cell = tableView.dequeueReusableCellWithIdentifier(identify) as! ActivityBaseTableViewCell
    let data = datas[indexPath.section][indexPath.row]
    cell.setData(data)
    return cell.getHeight() ?? cell.frame.height
  }
  
  func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView()
  }
  
  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return section == 0 ? 254 : 50
  }
  
  func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 0
  }
  
}