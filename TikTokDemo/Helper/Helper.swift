//
//  Helper.swift
//  TikTokDemo
//
//  Created by Quentin Zang on 2020/2/22.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import Foundation

extension Int {
    var toWanStr: String {
        if self > 10000 {
            let a = Double(exactly: self)! / 10000.0
            return round(a).description + "w"
        }
        return self.description
    }
}
