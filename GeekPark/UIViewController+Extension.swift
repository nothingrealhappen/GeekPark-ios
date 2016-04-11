//
//  UIViewController+Extension.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/8.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

extension UIViewController{
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
