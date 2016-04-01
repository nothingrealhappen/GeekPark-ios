//
//  ViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/17/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

  @IBOutlet weak var buttomTabBar: UITabBar!
  
  var controller: UIViewController?
  
  var currentItem: MenuItem?{
    didSet{
      changeController(currentItem?.controllerName)
    }
  }
  
  let menuItems = [
    MenuItem(title: "资讯", image: "news_icon", activeImage: "", controllerName: "TopicsViewController"),
    MenuItem(title: "活动", image: "activity_icon", activeImage: "", controllerName: "ActivitiesViewController"),
    MenuItem(title: "消息", image: "message_icon", activeImage: "", controllerName: "NotificationViewController"),
    MenuItem(title: "我的", image: "user_icon", activeImage: "", controllerName: "UserViewController")
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addButtomTabBarItems()
    currentItem = menuItems.first
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    LaunchView.showAtWindow()
  }
  
  private func addButtomTabBarItems(){
    buttomTabBar.items = menuItems.map{ item in
      UITabBarItem(title: item.title!, image: UIImage(named: item.image!), selectedImage: UIImage(named: item.activeImage!))
    }
  }
  
  
  private func changeController(controllerName: String?){
    guard let controllerName = controllerName else { return }
    let changeController: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier(controllerName)
    changeController.view.frame = CGRect(origin: view.frame.origin, size: CGSize(width: view.frame.width, height: view.frame.height - buttomTabBar.frame.height))
    view.addSubview(changeController.view)
    addChildViewController(changeController)
    changeController.didMoveToParentViewController(self)
    
    controller?.willMoveToParentViewController(nil)
    controller?.view.removeFromSuperview()
    controller?.removeFromParentViewController()
    controller = changeController
  }
  
}

extension ContainerViewController: UITabBarDelegate{
  func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
    let index = tabBar.items?.indexOf(item)
    let controllerName = menuItems[index ?? 0].controllerName
    changeController(controllerName)
  }
}