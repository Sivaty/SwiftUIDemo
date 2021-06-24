//
//  Rooms.swift
//  Rooms
//
//  Created by sengshuaibin on 2021/6/24.
//

import SwiftUI

struct Room: Identifiable {
    var id = UUID()
    var name: String
    var capcity: Int
    var hasVideo = false
    
    var imageName: String { "moon" }
    var thumbnailName: String { name + "Thumb" }
}

let testData = [
    Room(name: "Tom", capcity: 1, hasVideo: true),
    Room(name: "Jerry", capcity: 2, hasVideo: false),
    Room(name: "Jack", capcity: 3, hasVideo: true),
    Room(name: "Link", capcity: 4, hasVideo: false),
    Room(name: "Zelda", capcity: 5, hasVideo: true),
    Room(name: "Cano", capcity: 6, hasVideo: false),
    Room(name: "Coco", capcity: 7, hasVideo: true),
    Room(name: "Rose", capcity: 8, hasVideo: false),
    Room(name: "Thanos", capcity: 9, hasVideo: true)
]

