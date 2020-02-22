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
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var loadingView: NVActivityIndicatorView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        awemeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath)
        cell.textLabel?.text = awemeList[indexPath.row].desc
        return cell
    }
    
    //拖动结束
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        videoJsonIndex -= 1
        getList()
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
