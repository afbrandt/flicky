//
//  FlickerFeed.swift
//  Flicky
//
//  Created by Andrew Brandt on 5/13/17.
//  Copyright © 2017 Hello World. All rights reserved.
//

import Foundation
import Unbox

struct FlickerFeed {
    let description: String
    let generator: String
    let items: [FlickerFeedItem]
}

extension FlickerFeed: Unboxable {
    init(unboxer: Unboxer) throws {
        self.description = try unboxer.unbox(key: "description")
        self.generator = try unboxer.unbox(key: "generator")
        self.items = try unboxer.unbox(key: "items")
    }
}

struct FlickerFeedItem {
    let author: String
//    let authorId: String
//    let description: String
//    let link: String
    let imageUrl: FlickerMedia
//    let published: Date
//    let dateTaken: Date
    let tags: String
    let title: String
}

extension FlickerFeedItem: Unboxable {
    init(unboxer: Unboxer) throws {
        self.author = try unboxer.unbox(key :"author")
        self.title = try unboxer.unbox(key: "title")
        self.imageUrl = try unboxer.unbox(key: "media")
        self.tags = try unboxer.unbox(key: "tags")
    }
}

struct FlickerMedia {
    let url: String
}

extension FlickerMedia: Unboxable {
    init(unboxer: Unboxer) throws {
        self.url = try unboxer.unbox(key: "m")
    }
}
