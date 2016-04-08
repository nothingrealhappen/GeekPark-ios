//
//  CTTopNavigationBar.swift
//  GeekPark
//
//  Created by 朱坤 on 4/7/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

protocol CTTopNavigationBarDelegate{
  func back()
  func moveToComment()
}

enum buttonStyle{
  case write, like
}

class CTTopNavigationBar: UIView {
  enum PositionHidden{
    case hidden, visible
  }
  
  var topNavigationBarDelegate: CTTopNavigationBarDelegate?
  
  @IBOutlet weak var writeOrLikeButton: WriteOrLikeButton!
  
  var style: buttonStyle = .write
  var positionStyle: PositionHidden = .visible
  
  func moveUp(){
    guard positionStyle == .visible else { return }
    UIView.animateWithDuration(0.3, animations: {
      self.frame.origin.y = -self.frame.size.height
      }, completion: { _ in
      self.positionStyle = .hidden
    })
  }
  
  func moveDown(){
    guard positionStyle == .hidden else { return }
    UIView.animateWithDuration(0.3, animations: {
      self.frame.origin.y = 0
      }, completion: { _ in
      self.positionStyle = .visible
    })
  }
  override func willMoveToSuperview(newSuperview: UIView?) {
    super.willMoveToSuperview(newSuperview)
    writeOrLikeButton.style = self.style
    if style == .like{
      writeOrLikeButton.setImage(UIImage(named: "like_icon")!, forState: .Normal)
      writeOrLikeButton.style = .like
    } else {
      writeOrLikeButton.setImage(UIImage(named: "write_icon")!, forState: .Normal)
      writeOrLikeButton.style = .write
    }
  }
  
  @IBAction func clickBackAction(sender: AnyObject) {
    topNavigationBarDelegate?.back()
  }
  
  
  @IBAction func clickCommentAction(sender: AnyObject) {
    topNavigationBarDelegate?.moveToComment()
  }
  
  @IBAction func clickShareAction(sender: AnyObject) {
    //open new page to share
    print("share")
  }
}
