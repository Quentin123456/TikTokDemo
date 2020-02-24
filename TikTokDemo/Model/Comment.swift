//
//  Comment.swift
//  TikTokDemo
//
//  Created by Quentin Zang on 2020/2/24.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import Foundation

//评论
struct Comment: Codable {
    var text: String
    var digg_count: Int
    var create_time: Int
    var user: User
    var reply_comment: [Comment]?
}

//评论数
struct Comments: Codable {
    var comments: [Comment]
}
