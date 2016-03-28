//
//  ActivityDetailViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/23/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ActivityDetailViewController: FullScreenViewController {

  @IBOutlet weak var containerTable: UITableView!
  let cellIdentify = ["TopMainInfoViewCell", "ActivityDescribeViewCell", "ActivitySpeechesViewCell",  "ActivityJoinedAudienceViewCell", "ActivityCommentsViewCell"]
  
  //TODO
  let datas = [[["title": "活动", "value": "未来头条"], ["title": "活动", "value": "未来头条"], ["title": "活动", "value": "未来头条"]], ["未来头条 —— 发现那些带来改变的，并在未来有希望带来更大改变的产品和产品极客。更美：伴随着人们对美的向往以及生活方式的升级，全社会对整形的需求又不断的增加，与此同时，整形行业长久以来的信息不对称又使得整容这项平常的治疗手段饱受误解，让那些期望通过整容取悦自己的消费者望而却步。刘迪希望通过更美这款产品告诉全社会「整形也许并不像你们想的那样」。美若：时至今日，眼镜早已不再是治疗近视的工具，一副好的眼镜可以从根本上提升从根本从根本上提升佩上提升佩"], [[["time": "09:00", "speechTitle": "90赫兹和VR"], ["time": "10:00", "speechTitle": "90赫兹与VR现状"]]], [["https://dn-geekpark-new.qbox.me/uploads/user/avatar/000/216/517/thumb_16a3a14a1bb1bdead60fada0593075ca.jpg", "https://dn-geekpark-new.qbox.me/uploads/user/avatar/000/216/517/thumb_16a3a14a1bb1bdead60fada0593075ca.jpg"]], [[]]]
  let headerDatas = ["https://dn-geekpark-new.qbox.me/uploads/image/file/a2/31/a231fcf76b59f7981d2082a36d06a359.jpg?imageView2/2/w/302", "活动简介", "活动日程", "报名用户", "用户评论"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    containerTable.delegate = self
    containerTable.dataSource = self
    
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
    return 5
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
    return cell
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    let identify = cellIdentify[indexPath.section]
    let cell = tableView.dequeueReusableCellWithIdentifier(identify) as! ActivityBaseTableViewCell
    let data = datas[indexPath.section][indexPath.row]
    cell.setData(data)
    return cell.frame.height
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