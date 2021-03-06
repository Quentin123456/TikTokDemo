//
//  VideoCell.swift
//  TikTokDemo
//
//  Created by Quentin Zang on 2020/2/22.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit
import MarqueeLabel
import Kingfisher
import ChainableAnimations

class VideoCell: UITableViewCell {
    
    var animator1: ChainableAnimator!
    var animator2: ChainableAnimator!
    
    var aweme: AwemeList! {
        didSet {
            labelAuthor.text = aweme.author!.nickname
            labelDes.text = aweme.desc!
            
            //设置视频封面图
            let cover = aweme.video!.cover!.urlList![0]
            let coverUrl = URL(string: cover)!
            coverImageView.kf.setImage(with: coverUrl)
            
            //设置音乐标题和作者
            labelMusic.text = aweme.music!.title! + " - " + aweme.music!.author!
            labelMusic.restartLabel()
            
            //设置作者头像按钮
            let authorAvatar = aweme.author!.avatarThumb!.urlList![0]
            let avatarUrl = URL(string: authorAvatar)!
            folloBtn.kf.setBackgroundImage(with: avatarUrl, for: .normal)
            
//            folloBtn.layer.cornerRadius = 25
//            folloBtn.clipsToBounds = true
            
            //点赞、评论、转发
            labelLikeNum.text = aweme.statistics!.diggCount!.toWanStr
            labelCommentNum.text = aweme.statistics!.commentCount!.toWanStr
            labelShareNum.text = aweme.statistics!.shareCount!.toWanStr
            
            //唱盘音乐封面
            let musicCover = aweme.music!.coverThumb!.urlList![0]
            musicCoverImageView.kf.setImage(with: URL(string: musicCover)!)
            animator2 = ChainableAnimator(view: subDiskView)
            animator2.rotate(angle: 180).animateWithRepeat(t: 3.5, count: 50)
            
            //音符散发的动画
            diskView.raiseAnimate(imgName: "icon_home_musicnote1", delay: 0)
            diskView.raiseAnimate(imgName: "icon_home_musicnote2", delay: 1)
            diskView.raiseAnimate(imgName: "icon_home_musicnote1", delay: 2)
        }
    }

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var pauseImageView: UIImageView!
    
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelDes: UILabel!
    
    @IBOutlet weak var labelMusic: MarqueeLabel!
    
    @IBOutlet weak var addFollowBtn: UIButton!
    @IBOutlet weak var folloBtn: UIButton!
    
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var labelLikeNum: UILabel!
    
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var labelCommentNum: UILabel!
    
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var labelShareNum: UILabel!
   
    @IBOutlet weak var diskView: UIView!
    @IBOutlet weak var subDiskView: UIView!

    @IBOutlet weak var musicCoverImageView: UIImageView!
    @IBOutlet weak var rotateDiskView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        //重置关注按钮的所有动画状态
        if animator1 != nil {
            animator1.stop()
            addFollowBtn.transform = .identity
            addFollowBtn.layer.removeAllAnimations()
            addFollowBtn.setImage(UIImage(named: "icon_personal_add_little"), for: .normal)
        }
        
        //重置下一章切换
        diskView.resetViewAnimation()
        
    }

    @IBAction func addFollowTap(_ sender: UIButton) {
        print("点击了关注")
        
        animator1 = ChainableAnimator(view: sender)
        
        UIView.transition(with: sender, duration: 0.2, options: .transitionCrossDissolve, animations: {
            sender.setImage(UIImage(named: "iconSignDone"), for: .normal)
        }) { (_) in
            self.animator1.rotate(angle: 360).thenAfter(t: 0.6).wait(t: 0.3).transform(scale: 0).animate(t: 0.2)
            
        }
    }
}
