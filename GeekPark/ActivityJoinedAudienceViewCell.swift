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
  var audiences = [Audience]()
  
  override func setData(data: Any) {
    audiences = data as! [Audience]
    audienceCollectionView.dataSource = self
    audienceCollectionView.delegate = self
    audienceCollectionView.contentSize = CGSize(width: frame.width, height: frame.height)
  }
  
  override func getHeight() -> CGFloat? {
    var n = audiences.count / 7
    if audiences.count % 7 > 0 { n = n + 1 }
    return CGFloat((n + 1)*7 + 44 * n)
  }
  
}

extension ActivityJoinedAudienceViewCell: UICollectionViewDataSource{
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return audiences.count ?? 0
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AudienceAvatorCollectionViewCell", forIndexPath: indexPath) as! AudienceAvatorCollectionViewCell
    cell.setUrl(audiences[indexPath.row])
    return cell
  }
}

extension ActivityJoinedAudienceViewCell: UICollectionViewDelegateFlowLayout{
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 7
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 7
  }
  
}