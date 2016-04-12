//
//  Ticket.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/12.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import Foundation
class Ticket: BaseModel{
  
  var id: String = "123"
  var title: String = "未来头条·发现改变力"
  var time: String? = "3.19 13:00"
  var location: String? = "等等咖啡厅"
  var price: Double?
  var type: String? = "极客狂欢票"
  var used: Bool = false
  
  class func list(callback: [Ticket]->() ){
    var tickets = [Ticket]()
    for i in 0...2{
      let t = Ticket()
      t.id = String(i)
      tickets += [Ticket()]
    }
    callback(tickets)
  }
  
  
}