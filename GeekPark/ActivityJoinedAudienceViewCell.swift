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
  var avators = [String]()
  
  override func setData(data: Any) {
    avators = data as! [String]
    audienceCollectionView.dataSource = self
    audienceCollectionView.delegate = self
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
}

extension ActivityJoinedAudienceViewCell: UICollectionViewDataSource{
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return avators.count ?? 0
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AudienceAvatorCollectionViewCell", forIndexPath: indexPath) as! AudienceAvatorCollectionViewCell
    cell.setUrl(avators[indexPath.row])
    cell.avatorImage.circlize()
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