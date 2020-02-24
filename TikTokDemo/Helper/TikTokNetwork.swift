//
//  TikTokNetwork.swift
//  TikTokDemo
//
//  Created by Quentin Zang on 2020/2/22.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import Foundation
import Just

struct TiktokURL {
    static let baseLocal = "http://127.0.0.1:5500/"
    static let feedFile = "feed.json"
    
    static let commentLocal = URL(string: baseLocal + "/comment/xsy.json")!
}

typealias Success = () -> Void
typealias SuccessWithJson = (Any?) -> Void

struct TiktokNetwork {
    static let ERR = "json获取错误："
    
    //获取本地评论的json
    static func getComment(success: @escaping SuccessWithJson) {
        TiktokNetwork.getJson(url: TiktokURL.commentLocal, success: success)
    }
    
    
    static func getJson(url: URL, success: @escaping SuccessWithJson) {
        Just.get(url) { (r) in
            if r.ok {
                success(r.content)
            } else {
                debugPrint(TiktokNetwork.ERR, r.reason)
            }
        }
    }
}
