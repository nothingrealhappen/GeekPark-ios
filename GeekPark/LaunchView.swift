//
//  LaunchView.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/1.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

class LaunchView: UIView{
  
  @IBOutlet weak var imageView: UIImageView!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  static var loaded = false
  
  static func showAtWindow(image: String? = nil) {
    if loaded { return }
    loaded = true
    
    let launchView = NSBundle.mainBundle().loadNibNamed("LaunchView", owner: self, options: nil).first as! LaunchView
    
    let window = UIApplication.sharedApplication().keyWindow
    launchView.frame = window!.bounds
    window?.addSubview(launchView)
    
    if let imageUrl = image{
      launchView.imageView.kf_setImageWithURL(NSURL(string: imageUrl)!)
    }
    
    
    UIView.animateWithDuration(2.4, animations: {
      let scaleTransform: CGAffineTransform  = CGAffineTransformMakeScale(20, 20);
      launchView.imageView.transform = scaleTransform
      launchView.imageView.alpha = 0
      }, completion: { completion in
        if completion {
          launchView.removeFromSuperview()
        }
      }
    )
    
  }
  
  deinit {
  }

}
