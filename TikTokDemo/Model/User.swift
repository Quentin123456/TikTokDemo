//
//  User.swift
//  TikTokDemo
//
//  Created by Quentin Zang on 2020/2/24.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import Foundation

struct User: Codable {
    var nickName: String
    var avatar_thumb: Avatar_thumb
}

struct Avatar_thumb: Codable {
    var url_list: [String]
}
