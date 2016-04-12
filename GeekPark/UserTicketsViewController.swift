//
//  UserTicketsViewController.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/4/12.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit

class UserTicketsViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var tickets: [[Ticket]] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Ticket.list(){ tickets in
      self.tickets.append(tickets)
      let ticket = Ticket()
      ticket.used = true
      self.tickets.append([ticket])
    }
    setupViews()
  }
  
  func setupViews(){
    setupTable()
  }
  
  func setupTable(){
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension UserTicketsViewController: UITableViewDataSource{
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return tickets.count
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tickets[section].count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("UserTicketCell") as! UserTicketCell
    cell.ticket = tickets[indexPath.section][indexPath.row]
    return cell
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return section == 0 ? "" : "已完成的券"
  }
}

extension UserTicketsViewController: UITableViewDelegate{
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
}
