//
//  FeedCollectionViewCell.swift
//  Flicky
//
//  Created by Andrew Brandt on 5/13/17.
//  Copyright © 2017 Hello World. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class FeedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            if let imageView = imageView, let image = imageView.image {
                print(image.size)
            }
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dimensionsLabel: UILabel!
    
    func fetchImage(with url:String) {
        
        if let url = URL(string: url) {
            self.imageView.af_setImage(withURL: url, completion:{ (response: DataResponse<UIImage>) in
                if let image = response.value {
                    let size = image.size
                    let scale = UIScreen.main.scale
                    self.dimensionsLabel.isHidden = false
                    self.dimensionsLabel.text = "\(size.width * scale)w x \(size.height * scale)h"
                } else {
                    self.dimensionsLabel.isHidden = true
                }
            })
        }
    }
}
