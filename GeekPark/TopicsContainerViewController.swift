//
//  NewsViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/18/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

protocol ChangePageDelegate{
  func changePage(page: Int)
}

protocol ChangeTopLabelDelegate{
  func changeTopLabel(index: Int)
}

class TopicsContainerViewController: UIViewController, ChangePageDelegate{
  @IBOutlet weak var topScrollView: CTScrollView!
  
  //TODO
  var collectionTitle = ["最新", "极客之选", "产品观察","AR/VR","深度报道","编辑精选","极客早知道"]
  var pageViewController: UIPageViewController?
  var controllers = [TopicsPageViewController]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    topScrollView.setLabel(collectionTitle){ label in
      label.textColor = UIColor.blackColor()
      return label
    }
    generateControllers()
    topScrollView.changePageDelegate = self
    topScrollView.setCurrentPageIndex(0)
    loadPageViewController()
    LaunchView.showAtWindow()
  }
  
  private func generateControllers(){
    controllers = collectionTitle.enumerate().map{ (index, _) in
      let controller = storyboard?.instantiateViewControllerWithIdentifier("TopicsPageViewController") as! TopicsPageViewController
      controller.itemIndex = index
      controller.currentCollection = collectionTitle[index]
      controller.changeTopLabelDelegate = self
      return controller
    }
  }
  
  private func loadPageViewController(){
    pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
    pageViewController?.dataSource = self
    pageViewController?.view.frame = CGRect(origin: CGPoint(x: 0, y: topScrollView.frame.height), size: CGSize(width: view.frame.width, height: view.frame.height - topScrollView.frame.height))
    pageViewController?.view.backgroundColor = UIColor.blueColor()
    addChildViewController(pageViewController!)
    view.addSubview(pageViewController!.view)
    pageViewController?.didMoveToParentViewController(self)
    pageViewController?.setViewControllers([controllers[0]], direction: .Forward, animated: true, completion: nil)
  }
  
  func changePage(page: Int){
    let controller = controllers[page]
    pageViewController?.setViewControllers([controller], direction: .Forward, animated: false, completion: nil)
  }
}

extension TopicsContainerViewController: UIPageViewControllerDataSource {
  func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    let controller = viewController as! TopicsPageViewController
    return turnPageController(controller.itemIndex, forward: true)
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    let controller = viewController as! TopicsPageViewController
    return turnPageController(controller.itemIndex, forward: false)
  }
  
  private func turnPageController(currentIndex: Int, forward: Bool) -> UIViewController?{
    let edge = forward ? (collectionTitle.count - 1) : 0
    var controller: TopicsPageViewController?
    if currentIndex == edge {
      controller = nil
    } else {
      let index = currentIndex + (forward ? 1 : -1)
      controller = controllers[index]
    }
    return controller
  }
  
  func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
  }
  
}

extension TopicsContainerViewController: ChangeTopLabelDelegate{
  func changeTopLabel(index: Int) {
    topScrollView.setCurrentPageIndex(index)
  }
}