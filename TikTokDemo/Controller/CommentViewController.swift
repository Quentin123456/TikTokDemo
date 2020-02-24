//
//  CommentViewController.swift
//  TikTokDemo
//
//  Created by Quentin Zang on 2020/2/24.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {

    @IBOutlet weak var commentAreaView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapClose(_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
    }
    
    @IBAction func tapToClose(_ sender: UITapGestureRecognizer) {
        
        //单击手势组件，点击时相当于 评论view的位置
        let tapPoint = sender.location(in: commentAreaView)
        
        //如果位置不位于评论qview之中，则关闭
        if !commentAreaView.layer.contains(tapPoint) {
             self.dismiss(animated: true)
        }
       
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
