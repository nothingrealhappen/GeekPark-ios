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
  var topNavigationBar = CTTopNavigationBar()
  
  var activity_id = ""
  var activity: Activity?
  
  let cellIdentify = ["TopMainInfoViewCell", "ActivityDescribeViewCell", "ActivitySpeechesViewCell",  "ActivityJoinedAudienceViewCell", "ActivityCommentsViewCell"]
  
  var datas: [NSArray] = [[], [], [], [], []]{
    didSet{
      containerTable.reloadData()
      addTopNavigationbar()
    }
  }
  var headerDatas: [String] = ["", "活动简介", "活动日程", "报名用户", "用户评论"]
  
  func addTopNavigationbar(){
    //添加头部的navigationBar
    topNavigationBar = NSBundle.mainBundle().loadNibNamed("CTTopNavigationBar", owner: self, options: nil).first as! CTTopNavigationBar
    let naviHeight = navigationController?.navigationBar.frame.height ?? 0 + 10
    topNavigationBar.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: naviHeight)
    topNavigationBar.topNavigationBarDelegate = self
    topNavigationBar.style = .like
    view.addSubview(topNavigationBar)
    topNavigationBar.layer.zPosition = 5
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    containerTable.delegate = self
    containerTable.dataSource = self
    
    Activity.member(activity_id){ activity in
      self.activity = activity
      self.headerDatas = [activity.banner ?? "", "活动简介", "活动日程", "\(activity.audiences?.count ?? 0)人已报名", "\(activity.comments?.count ?? 0)条评论"]
      self.datas = [activity.infoDictionary(), [activity.introduction ?? ""], [activity.speeches ?? []], [activity.audiences ?? []], [activity.comments ?? []]]
    }
    
    //让table滚动时header不为float
    let height: CGFloat = 230
    let view = UIView(frame: CGRect(x: 0, y: 0, width: containerTable.frame.width, height: height))
    containerTable.tableHeaderView = view
    containerTable.contentInset = UIEdgeInsetsMake(-height, 0, 0, 0)
  }
  
  override func viewWillAppear(animated: Bool) {
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  override func viewWillDisappear(animated: Bool) {
    navigationController?.setNavigationBarHidden(false, animated: false)
  }
  
}

extension ActivityDetailViewController: CTTopNavigationBarDelegate {
  func back() {
    navigationController?.popViewControllerAnimated(true)
  }
  
  func moveToComment() {
  }
  
}

extension ActivityDetailViewController: UITableViewDelegate {
  func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    if velocity.y > 0 {
      topNavigationBar.moveUp()
    } else if velocity.y < 0 {
      topNavigationBar.moveDown()
    }
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    //点击地点的时候
    if indexPath.section == 0 && indexPath.row == 2{
      selectMap(activity?.location)
    }
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    let identify = cellIdentify[indexPath.section]
    let cell = tableView.dequeueReusableCellWithIdentifier(identify) as! ActivityBaseTableViewCell
    let data = datas[indexPath.section][indexPath.row]
    cell.setData(data)
    return cell.getHeight() ?? cell.frame.height
  }
  
  
  func selectMap(location: String?){
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
    if UIApplication.sharedApplication().canOpenURL(NSURL(string: "iosamap://")!){
      alert.addAction(UIAlertAction(title: "高德", style: .Default, handler: { action in
        self.openMap("iosamap://poi?sourceApplication=com.zk.gif&backScheme=ZkunGif&name=" + (location ?? ""))
      }))
    }
    if UIApplication.sharedApplication().canOpenURL(NSURL(string: "baidumap://")!){
      alert.addAction(UIAlertAction(title: "百度", style: .Default, handler: { action in
        self.openMap("baidumap://map/geocoder?address=" + (location ?? ""))
      }))
    }
    alert.addAction(UIAlertAction(title: "自带地图", style: .Default, handler:{ action in
      self.openMap("http://maps.apple.com/?daddr=" + (location ?? ""))
    }))
    alert.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: nil))
    presentViewController(alert, animated: true, completion: nil)
  }
  
  func openMap(url: String){
    let urlStr : NSString = url.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLFragmentAllowedCharacterSet())!
    let searchURL : NSURL = NSURL(string: urlStr as String)!
    UIApplication.sharedApplication().openURL(searchURL)
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
      removeButtomLine.selectionStyle = .Gray
    }
    cell.setData(data)
    if identify == "ActivityDescribeViewCell" {
      (cell as! ActivityDescribeViewCell).viewControllerDelegate = self
    }
    return cell
  }
  
  func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let identify = section == 0 ? "TopImageHeaderCell" : "HeaderViewCell"
    let data: Any = headerDatas[section]
    let cell = tableView.dequeueReusableCellWithIdentifier(identify) as! ActivityBaseTableViewCell
    cell.setData(data)
    return cell.contentView
  }
  
  func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView()
  }
  
  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return section == 0 ? 190: 50
  }
  
  func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 0
  }
  
}

extension ActivityDetailViewController: ViewControllerDelegate{
  func callbackFromViewEvent() {
    let controller = storyboard?.instantiateViewControllerWithIdentifier("ActivityIntroductionViewController") as! ActivityIntroductionViewController
    controller.introduction = activity?.introduction ?? ""
    navigationController?.pushViewController(controller, animated: true)
  }
}