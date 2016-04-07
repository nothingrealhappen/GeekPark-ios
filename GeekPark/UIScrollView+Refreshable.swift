//
//  UIScrollView+Refreshable.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/31.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

private var kvoContext = "RefreshAble"
private let ContentOffsetKeyPath = "contentOffset"
private let refreshControlTag = 324


extension UIScrollView{
  private struct AssociatedKeys {
    static var delegateName = "refreshableDelegate"
    static var isLoadingName = "isLoading"
  }
  
  var refreshableDelegate: GRefreshable?{
    get{
      return objc_getAssociatedObject(self, &AssociatedKeys.delegateName) as? GRefreshable
    }
    set(newValue){
      if newValue != nil{
        addContentOffSetObserver()
      }
      refreshControl?.removeFromSuperview()
      addRefreshControl()
      objc_setAssociatedObject(self,&AssociatedKeys.delegateName,newValue as! NSObjectProtocol? ,objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
  }
  
  func addRefreshControl(){
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(UIScrollView.handleScrollViewRefresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
    refreshControl.tag = refreshControlTag
    addSubview(refreshControl)
  }
  
  var isLoading: Bool?{
    get { return objc_getAssociatedObject(self, &AssociatedKeys.isLoadingName) as? Bool }
    set(newValue) {
      if let isLoading = newValue{
        if !isLoading{
          self.refreshControl?.endRefreshing()
        }
      }
      objc_setAssociatedObject(self,
                                   &AssociatedKeys.isLoadingName,
                                   newValue ,
                                   objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
  }
  
  var refreshControl: UIRefreshControl? {
    get{
      let refreshControl = viewWithTag(refreshControlTag)
      return refreshControl as? UIRefreshControl
    }
  }
  
  func handleScrollViewRefresh(refreshControl: UIRefreshControl) {
    isLoading = true
    refreshableDelegate?.pullRefresh()
  }
  
  override public func willMoveToSuperview(newSuperview: UIView?) {
    super.willMoveToSuperview(newSuperview)
  }
  
  func addContentOffSetObserver(){
    addObserver(self, forKeyPath: ContentOffsetKeyPath, options: .Initial, context: &kvoContext)
  }
  
  func removeContentOffSetObserver(){
    removeObserver(self, forKeyPath: ContentOffsetKeyPath)
  }
  
  
  public override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
    if(context == &kvoContext){
      if isLoading ?? false {
        return
      }
      let heightNow = contentOffset.y + frame.size.height
      let maxHeight = contentSize.height
      if maxHeight - heightNow < 300 {
        isLoading = true
        refreshableDelegate?.loadMore()
      }
    }else{
      super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
    }
  }
  
}


