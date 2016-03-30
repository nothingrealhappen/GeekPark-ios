//
//  TopicDetailViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/22/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class TopicDetailViewController: FullScreenViewController {
  @IBOutlet weak var topicCover: UIImageView!
  
  @IBOutlet weak var webView: UIWebView!
  @IBOutlet weak var scrollView: UIScrollView!
  
  @IBOutlet weak var webViewHeight: NSLayoutConstraint!
  @IBOutlet weak var detailZone: UIView!
  @IBOutlet weak var topicTitle: UILabel!
  @IBOutlet weak var authorName: UILabel!
  @IBOutlet weak var pushlishTime: UILabel!
  
  var topic: Topic?{
    didSet{
      loadWebView()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
    webView.delegate = self
    Topic.findById(topic?.id, handler: self){ topic in
      self.topic = topic
    }
    loadWebView()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    loadWebView()
  }
  
  private func updateUI(){
    topicCover.kf_setImageWithURL(NSURL(string: topic?.cover?.file_url ?? "")!)
    topicTitle.text = topic?.title
    authorName.text = topic?.author?.username
    pushlishTime.text = topic?.publishedTime
  }
  
  private func loadWebView(){
    guard let contentBody = topic?.body else { return }
    let bundle = NSBundle.mainBundle()
    let myFilePath = bundle.pathForResource("topic", ofType: "css")
    let css = try? String(contentsOfFile:myFilePath!, encoding:NSUTF8StringEncoding)
    let content = "<style type='text/css' scoped >\(css!)</style>\(contentBody)"
    webView.loadHTMLString(content, baseURL: nil)
    webView.scrollView.scrollEnabled = false
    webView.sizeToFit()
  }
  
}

extension TopicDetailViewController: UIWebViewDelegate{
  
  func webViewDidFinishLoad(webView: UIWebView) {
    webView.sizeToFit()
    webViewHeight.constant = webView.scrollView.contentSize.height + webView.frame.origin.y
    configScrollView()
  }
  
  private func configScrollView(){
    let height = topicCover.frame.height + webView.scrollView.contentSize.height + detailZone.frame.height
    scrollView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: height)
  }
  
}