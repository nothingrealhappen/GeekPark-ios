//
//  CTScrollView.swift
//  GeekPark
//
//  Created by 朱坤 on 3/18/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class CTScrollView: UIScrollView {
  var labelTitle: [String]?
  var labels: [UILabel]?
  let padding: CGFloat = 30
  var changePageDelegate: ChangePageDelegate?
  var currentIndex = 0

  func setLabel(labelTitle: [String], setupLabelFunction: (UILabel)->(UILabel)){
    self.labelTitle = labelTitle
    labels = labelTitle.map(){ title in
      var label = UILabel()
      label.text = title
      label.font = UIFont.systemFontOfSize(14)
      label.sizeToFit()
      label.userInteractionEnabled = true
      label.frame.origin.x = self.contentSize.width + padding/2
      label = setupLabelFunction(label)
      self.contentSize.width += (CGRectGetMaxX(label.bounds) + padding)
      addSubview(label)
      label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CTScrollView.handleTapGesture(_:))))
      return label
    }
    contentSize.height = 10
  }
  
  func setCurrentPageIndex(index: Int){
    let label = labels?[index]
    hightAndMoving(label!)
  }
  
  func hightAndMoving(label: UILabel){
    //被点击的label高亮
    labels?.map{ $0.textColor = UIColor.blackColor() }
    label.textColor = UIColor.blueColor()
    
    //移动到被点击的label处
    var x = label.frame.origin.x - (frame.width - label.frame.width)/2
    if x > contentSize.width{
      x = contentSize.width
    } else if x < 0{
      x = 0
    }
    UIView.animateWithDuration(0.3, animations: {
      self.contentOffset.x = x
    })
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  
}

extension CTScrollView: UIGestureRecognizerDelegate{
  func handleTapGesture(gesture: UIGestureRecognizer){
    let label = gesture.view as! UILabel
    hightAndMoving(label)
    changePageDelegate?.changePage((labels?.indexOf(label))!)
  }
}