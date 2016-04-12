//
//  UserTicketCell.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/12.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

class UserTicketCell: UITableViewCell {

  @IBOutlet weak var locationText: UILabel!
  @IBOutlet weak var timeText: UILabel!
  @IBOutlet weak var typeText: UILabel!
  @IBOutlet weak var titleText: UILabel!
  @IBOutlet weak var ticketBg: UIImageView!
  
  var ticket: Ticket?{ didSet{ updateViews() } }
  
  func updateViews(){
    titleText.text = ticket?.title
    typeText.text = ticket?.type
    timeText.text = ticket?.time
    locationText.text = ticket?.location
    ticketBg.image = (ticket?.used ?? false) ? UIImage(named: "used-ticket-bg") : UIImage(named: "ticket-bg")
  }
}
