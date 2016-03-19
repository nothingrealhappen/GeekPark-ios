//
//  NewsViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/18/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class TopicsContainerViewController: UIViewController {
  @IBOutlet weak var topScrollView: CTScrollView!
  
  var collectionTitle = ["全部", "极客之选","产品观察","AR/VR","深度报道","编辑精选","极客早知道"]
  
  override func viewDidLoad() {
    
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    topScrollView.setLabel(collectionTitle){ label in
      label.textColor = UIColor.blackColor()
      return label
    }
  }
  
  private func setupTopScrollView(){
    
  }
  
  private func loadPageViewController(){
  }
}
