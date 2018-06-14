//
//  achievenments.swift
//  ZeplinPractice
//
//  Created by James H Layton on 6/14/18.
//  Copyright © 2018 james. All rights reserved.
//

struct AchievenmentData: Decodable {
    var success: Bool
    var status: Int
    var overview: [String: String]
    var achievements: [Achievenments]
}

struct Achievenments: Decodable {
    var id: Int
    var level: String
    var progress: Int
    var total: Int
    var bg_image_url: String
    var accessible: Bool
}
