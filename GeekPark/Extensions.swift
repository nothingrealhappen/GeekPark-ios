//
//  Extensions.swift
//  GeekPark
//
//  Created by 朱坤 on 3/25/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

extension UIView: CircleAble {
  func circlize(){
    layer.cornerRadius = bounds.height / 2
    clipsToBounds = true
  }
  
  func circlizeWithBorder(){
    circlize()
    layer.borderWidth = 1
  }
  
}


extension UIViewController: GDataHandler, UIGestureRecognizerDelegate{
  func onDataEmpty() {
    showEmptyView("还没有新消息哦",imageName: "empty-icon")
  }
  
  func onDataRefresh() {
    print("refresh")
  }
  
  func onDataError() {
    showEmptyView("出现了点小问题", imageName: "empty-icon")
  }
  
  private func showEmptyView(msg: String, imageName: String){
    let container = UIView(frame: CGRect(origin: view.frame.origin, size: view.frame.size))
    
    let label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: view.frame.width, height: 14)))
    label.text = msg
    label.font = label.font.fontWithSize(14)
    label.textColor = UIColor(red: 137/255.0, green: 137/255.0, blue: 137/255.0, alpha: 1)
    label.textAlignment = NSTextAlignment.Center
    label.center = container.center
    container.addSubview(label)
    
    let imageView = UIImageView(frame: CGRect(origin: CGPoint.zero ,size: CGSize(width: 78, height: 78)))
    imageView.image = UIImage(named: imageName)
    imageView.center = CGPoint(x: container.center.x ,
                               y: container.center.y - label.frame.height/2 - imageView.frame.height / 2 - 30 )
    container.addSubview(imageView)
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.handleTap(_:)))
    tap.delegate = self
    container.addGestureRecognizer(tap)
    
    view.addSubview(container)
  }
  
  func handleTap(sender: UITapGestureRecognizer? = nil) {
    sender?.view?.removeFromSuperview()
    onDataRefresh()
  }
  
}

extension NSDate {
  public var timeAgo: String{
    let components = self.dateComponents()
    if components.year > 0 {
      return "\(components.year)年之前"
    }
    if components.month > 0 {
      return "\(components.month)月之前"
    }
    if components.day > 0 {
      return "\(components.day)天之前"
    }
    if components.hour > 0 {
      return "\(components.hour)小时之前"
    }
    if components.minute > 0 {
      return "\(components.minute)分钟之前"
    }
    return "\(components.second)秒之前"
  }
  
  private func dateComponents() -> NSDateComponents {
    let calander = NSCalendar.currentCalendar()
    return calander.components([.Second, .Minute, .Hour, .Day, .Month, .Year], fromDate: self, toDate: NSDate(), options: [])
  }

  static func formateTimeFromTimeStamp(timestamp: String, formateString: String) -> String?{
    guard let dou = Double(timestamp) else { return nil }
    let date = NSDate(timeIntervalSince1970: dou)
    let formatter = NSDateFormatter()
    formatter.dateFormat = formateString
    return formatter.stringFromDate(date)
  }
}
