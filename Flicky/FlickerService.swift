//
//  FlickerService.swift
//  Flicky
//
//  Created by Andrew Brandt on 5/13/17.
//  Copyright © 2017 Hello World. All rights reserved.
//

import UIKit
import Alamofire
import Unbox

let FLICKER_BASE_URL = "https://api.flickr.com"
let FLICKER_PHOTO_FEED_ENDPOINT = "services/feeds/photos_public.gne"

class FlickerService: NSObject {

    static func getPhotos(tagged tags:String, completion: @escaping (FlickerFeed?, Error?) -> Void) {
        let params: Dictionary<String, Any> = [
            "tagmode" : "any",
            "format" : "json",
            "nojsoncallback" : 1,
            "tags" : tags
        ]
        
        Alamofire.request("\(FLICKER_BASE_URL)/\(FLICKER_PHOTO_FEED_ENDPOINT)", parameters: params)
            .responseJSON { (response: DataResponse<Any>) in
                guard response.result.isSuccess, let json = response.result.value as? Dictionary<String, Any> else {
                    print(response)
                    completion(nil, response.error)
                    return
                }
                
                var feed: FlickerFeed? = nil
                var error: Error? = nil
                do {
                    let unboxFeed: FlickerFeed = try unbox(dictionary: json)
                    feed = unboxFeed
                } catch let e {
                    print(e)
                    error = e
                }
                completion(feed, error)
            }
    }
}
