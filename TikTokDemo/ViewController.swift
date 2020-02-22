//
//  ViewController.swift
//  TikTokDemo
//
//  Created by Quentin Zang on 2020/2/22.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath)
        cell.textLabel?.text = lists[indexPath.row]
        return cell
    }
    

    var lists = ["琵琶小姐姐","跳舞小姐姐","跑车小姐姐"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

