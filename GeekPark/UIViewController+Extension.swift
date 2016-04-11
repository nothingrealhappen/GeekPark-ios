//
//  UIViewController+Extension.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/8.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

extension UIViewController{
  
  class func initByName(storyboardName: String) -> Self
  {
    return instantiateFromStoryboardHelper(storyboardName, storyboardId: nameOfClass)
  }
  
  private class func instantiateFromStoryboardHelper<T>(storyboardName: String, storyboardId: String) -> T
  {
    let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
    let controller = storyboard.instantiateViewControllerWithIdentifier(storyboardId) as! T
    return controller
  }
  
  private func gct_pushViewController(viewController: UIViewController, animated: Bool, hideTabbar: Bool) {
    viewController.hidesBottomBarWhenPushed = hideTabbar
    self.navigationController?.pushViewController(viewController, animated: animated)
  }
  
  public func gct_pushAndHideTabbar(viewController: UIViewController) {
    self.gct_pushViewController(viewController, animated: true, hideTabbar: true)
  }
  
  public func ts_presentViewController(viewController: UIViewController, completion:(() -> Void)?) {
    let navigationController = UINavigationController(rootViewController: viewController)
    self.presentViewController(navigationController, animated: true, completion: completion)
  }
  

}

