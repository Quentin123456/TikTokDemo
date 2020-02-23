//
//  ViewController.swift
//  TikTokDemo
//
//  Created by Quentin Zang on 2020/2/22.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var awemeList = [AwemeList]()
    var videoJsonIndex = 12
    
    var currentPage = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var loadingView: NVActivityIndicatorView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        awemeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        //cell.textLabel?.text = awemeList[indexPath.row].desc
        cell.aweme = awemeList[indexPath.row]
        return cell
    }
    
    //行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    //拖动结束
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        videoJsonIndex -= 1
        getList()
        currentPage = tableView.indexPathsForVisibleRows!.last!.row
        print("页面：", currentPage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingView.startAnimating()
        getList()
        
    }
    
    func getList() {
        let url = URL(string: TiktokURL.baseLocal + videoJsonIndex.description + TiktokURL.feedFile)!
        getAwelist(url: url)
    }

    func getAwelist(url: URL) {
        do {
            let feed = try Feed(fromURL: url)
            if let awemeList = feed.awemeList {
                self.awemeList += awemeList
                //在reload之前结束动画
                loadingView.stopAnimating()
                self.tableView.reloadData()
            }
        } catch {
            debugPrint("解析错误",error)
        }
    }

}

