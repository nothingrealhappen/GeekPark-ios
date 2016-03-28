//
//  Speech.swift
//  GeekPark
//
//  Created by 朱坤 on 3/27/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import Foundation

class Speech: BaseModel{
  var id = ""
  var title = ""
  var timestamp_start_at = ""
  var introduction: String?
  var guests = [Guest]()
}