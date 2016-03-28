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
  
  var topic: Topic?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    topic?.body = "<h2>极客头条：iPhone 7 机壳曝光：背面终于没有白带了！</h2><p><strong>来源：<a href='http://tech.ifeng.com/a/20160314/41562462_0.shtml'>凤凰科技</a></strong></p><p>最近 NowhereElse.fr 网站曝光了 iPhone 7 机壳的工程制图。如果图片属实，iPhone 7 的摄像头尺寸将明显增加，天线线条也会重新设计。</p><p>乍一看，手机背部的水平天线线条被剔除。背部仍然有一些线条与底部边缘并列，只是线条颜色更清淡，它和弯曲的机身底部边缘靠在一起，在 iPhone 6s 上采用的直线天线线条设计不会出现在 iPhone 7 中。</p><p><img alt='33843cffaa404ff.jpg' class='' src='https://dn-geekpark-new.qbox.me/uploads/image/file/62/cd/62cd3a604fd7b268b92d999a05be6ff2.jpg' height='589' data-image-size='841,589'></p><p>细细观察，我们还可以发现 iPhone 7 的摄像头也采用了全新设计。与现有 iPhone 相比，iPhone 7 的摄像头尺寸明显增大，摄像头的开口离手机边缘更近。</p><p><img alt='88cb254c6cff0bf.jpg' class='' src='https://dn-geekpark-new.qbox.me/uploads/image/file/57/d8/57d8e28008c6bc769d7e22f0f0cb62e9.jpg' height='559.584' data-image-size='1000,603'></p><p>之前有传言说 iPhone 7 会安装双摄像头系统，从图片来看不是这么一回事，许多人可能会失望，需要指出的是图片显示的是 4.7 英寸 iPhone 7。</p><p>之前的传言暗示双摄像头系统会安装在 5.5 英寸 iPhone 7 Plus 上，安装双摄像头系统的手机可能会取名叫作「iPhone 7 Pro」。除此之外，iPhone 7 手机机壳比现有 iPhone 稍微要薄一些。</p><p><strong>点评：</strong>Sony 做到了无白带无断点，锤子也做到了，为啥 iPhone 7 还是做不到呢？</p><h2>一台 Galaxy S7 硬件成本仅占售价三分之一？</h2><p><strong>来源：<a href='http://tech.sina.com.cn/t/2016-03-14/doc-ifxqhmve9181943.shtml'>新浪科技</a></strong></p><p>调研公司 IHS 今日发布报告称，三星新一代旗舰智能手机 Galaxy S7 的每部成本仅为 255 美元，意味着每部手机的利润超过 400 美元。</p><p>报告显示，Galaxy S7 最贵的零部件是高通骁龙 820 处理器，每片成本约为 62 美元。其次是 1200 万像素摄像头模块，成本 13.80 美元。组装费用为 5 美元，而剩下的 174.30 美元费用包括铝制中框、玻璃背板、Super AMOLED 显示屏和 SSD 等。</p><p><strong>点评：</strong>别看硬件成本低，三星的营销成本可真不低。</p><h2>体验 VR 眩晕怎么办？电电耳朵可破</h2><p><strong>来源：<a href='http://www.cnbeta.com/articles/483467.htm'>cnBeta</a></strong></p><p>为了解决 VR 带来的眩晕感，三星想出了奇招。三星 C-Labs 研发的 Entrim 4D 在进行 VR 体验时，竟然还会用电流刺激你的内耳。</p><p><img alt='17208d92fe7acb9.jpg_600x600.jpg' class='' src='https://dn-geekpark-new.qbox.me/uploads/image/file/d0/d9/d0d99c9d0022f4de77480d1a99cd5e5b.jpg' height='399' data-image-size='600,399'></p><p>原来内耳里可不仅仅有负责听觉的耳蜗，还有负责平衡的前庭。后者能让你产生自己正在运动的感觉，而体验 VR 时那种强烈的眩晕感正是因为视觉上的运动和身体实际静止相矛盾导致的。</p><p><strong>点评：</strong>为了欺骗大脑，体验 VR 还得被电击……</p><h2>恐怖分子爱用诺基亚，原因居然是……</h2><p><strong>来源：<a href='http://tech.qq.com/a/20160314/033553.htm'>腾讯科技</a></strong></p><p>最近的一份调查报告显示，微软出产的诺基亚 105 功能手机，竟然大受极端武装分子组织 ISIS 的欢迎，成为人人必备。重要原因是该手机已经成为简易炸弹的标准引爆工具。</p><p>诺基亚 105 手机在极端组织中流行的原因主要有两个，分别是供应重组和使用方便。武装分子已经获得了稳定的 105 手机供应，要么是大批量采购要么是盗窃。除了手机之外，极端分子也能够获得足够的 SIM 卡。</p><p><strong>点评：</strong>其实还有一个原因——关键时刻还能挡一颗子弹。</p><h2>春来了？网络约车有望合法化</h2><p><strong>来源：<a href='http://tech.163.com//16/0314/16/BI4OEMBC00094OE0.html'>网易科技</a></strong></p><p>交通部长杨传堂在 3 月 14 日全国人大新闻中心举办的记者会上表示，没有取得营运资质的车辆从事营运是非法行为，属于黑车。</p><p>网约车是新生事物，私家车当专车不能简单套用巡游车管理办法，对此应「量体裁衣」制定新规，应给予其合法出路, 加强顶层设计进行管理。</p><p><strong>点评：</strong>看来，这位一定是「有机会」亲身体验手机叫车。</p>"
    loadWebView()
  }
  
  private func updateUI(){
    topicCover.kf_setImageWithURL(NSURL(string: topic?.topicCover ?? "")!)
    topicTitle.text = topic?.title
    authorName.text = topic?.authorName
    pushlishTime.text = topic?.publishTime
  }
  
  private func loadWebView(){
    webView.delegate = self
    let bundle = NSBundle.mainBundle()
    let myFilePath = bundle.pathForResource("topic", ofType: "css")
    let css = try? String(contentsOfFile:myFilePath!, encoding:NSUTF8StringEncoding)
    let content = "<style type='text/css' scoped >\(css!)</style>\(topic?.body ?? "")"
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