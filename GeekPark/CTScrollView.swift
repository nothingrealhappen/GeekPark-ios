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
  
  let normalSize: CGFloat = 14.0
  let highlightSize: CGFloat = 16.0
  let normalColor = UIColor(red:150/255, green: 150/255, blue: 150/255, alpha: 1)
  let highlightColor = UIColor(red:20/255, green: 95/255, blue: 243/255, alpha: 1)

  func setLabel(labelTitle: [String], setupLabelFunction: (UILabel)->(UILabel)){
    self.labelTitle = labelTitle
    labels = labelTitle.map(){ title in
      var label = UILabel()
      label.text = title
      label.font = UIFont.systemFontOfSize(normalSize)
      label.sizeToFit()
      label.textColor = normalColor
      label.userInteractionEnabled = true
      label.frame.origin.x = self.contentSize.width + padding/2
      label.frame.origin.y = 28
      label = setupLabelFunction(label)
      self.contentSize.width += (CGRectGetMaxX(label.bounds) + padding)
      addSubview(label)
      label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CTScrollView.handleTapGesture(_:))))
      return label
    }
    contentSize = CGSizeMake(contentSize.width, 0)
  }
  
  func setCurrentPageIndex(index: Int){
    let label = labels?[index]
    hightAndMoving(label!)
  }
  
  func hightAndMoving(label: UILabel){
    //被点击的label高亮
    labels?.map{
      $0.textColor = normalColor
      $0.font = UIFont.systemFontOfSize(normalSize)
    }
    label.textColor = highlightColor
    label.font = UIFont.systemFontOfSize(highlightSize)
    label.sizeToFit()
    
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