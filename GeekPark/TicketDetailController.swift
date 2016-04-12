//
//  TicketDetailController.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/12.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit
import QRCode

class TicketDetailController: UIViewController {

  @IBOutlet weak var tipsText: UILabel!
  @IBOutlet weak var titleText: UILabel!
  @IBOutlet weak var qrImage: UIImageView!
  @IBOutlet weak var typeText: UILabel!
  @IBOutlet weak var timeText: UILabel!
  @IBOutlet weak var locationText: UILabel!
  @IBOutlet weak var titleBg: UIView!
  
  var ticket: Ticket?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    updateViews()
  }
  
  func updateViews(){
    titleBg.backgroundColor = (ticket?.used ?? false) ?  Config.Color.ticketUsedColor : Config.Color.ticketNormalColor
    titleText.text = ticket?.title
    typeText.text = ticket?.type
    timeText.text = ticket?.time
    locationText.text = ticket?.location
    var qrcode = QRCode(ticket?.id ?? "")
    qrcode?.color = (ticket?.used ?? false) ? CIColor(rgba: "A0A0A0") : CIColor(rgba: "000000")
    qrImage.image = qrcode?.image
  }
}
