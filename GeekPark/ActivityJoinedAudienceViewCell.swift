//
//  ActivityJoinedAudienceViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/25/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ActivityJoinedAudienceViewCell: ActivityBaseTableViewCell{

  @IBOutlet weak var audienceCollectionView: UICollectionView!
  //一行几个
  var n = 0
  //第三行最后一个的下标
  var m = 0
  var audiences = [Audience]()
  
  override func setData(data: Any) {
    audiences = data as! [Audience]
    audienceCollectionView.dataSource = self
    audienceCollectionView.delegate = self
    audienceCollectionView.contentSize = CGSize(width: frame.width, height: frame.height)
    getColumn()
  }
  
  override func getHeight() -> CGFloat? {
    //行数
    var m = audiences.count / n
    if audiences.count % n > 0 { m = m + 1 }
    if m > 3{ m = 3 }
    return CGFloat((m - 1)*10 + 34 * m) + 10
  }
  
  private func getColumn(){
    n = (Int(UIScreen.mainScreen().bounds.width) - 24) / 39
    m = n * 3 - 1
  }
  
}

extension ActivityJoinedAudienceViewCell: UICollectionViewDataSource{
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if audiences.count > m + 1{
      return m + 1
    }
    return audiences.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AudienceAvatorCollectionViewCell", forIndexPath: indexPath) as! AudienceAvatorCollectionViewCell
    if indexPath.row != m{
      cell.setUrl(audiences[indexPath.row])
    } else {
      cell.avatorImage.image = UIImage(named: "etc_icon")
    }
    return cell
  }
}

extension ActivityJoinedAudienceViewCell: UICollectionViewDelegateFlowLayout{
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 5
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 10
  }
  
}