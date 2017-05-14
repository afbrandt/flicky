//
//  FeedCollectionViewCell.swift
//  Flicky
//
//  Created by Andrew Brandt on 5/13/17.
//  Copyright © 2017 Hello World. All rights reserved.
//

import UIKit
import AlamofireImage

class FeedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dimensionsLabel: UILabel!
    
    func fetchImage(with url:String) {
        DispatchQueue.global(qos: .userInitiated).async {
            
            DispatchQueue.main.async {
                
            }
        }
        if let url = URL(string: url) {
            self.imageView.af_setImage(withURL: url)
        }
    }
}
