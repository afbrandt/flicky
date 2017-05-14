//
//  FeedViewController.swift
//  Flicky
//
//  Created by Andrew Brandt on 5/13/17.
//  Copyright © 2017 Hello World. All rights reserved.
//

import UIKit

let FEED_CELL_IDENTIFIER = "FeedCollectionViewCell"

class FeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var feedItems: [FlickerFeedItem] = []

    //MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.register(UINib(nibName: FEED_CELL_IDENTIFIER, bundle: nil), forCellWithReuseIdentifier: FEED_CELL_IDENTIFIER)
    
        FlickerService.getPhotos(tagged: "orange") { (feed: FlickerFeed?, error: Error?) in
            guard let feed = feed else {
                
                return
            }
            
            self.feedItems = feed.items
            self.collectionView?.reloadData()
            print(feed.items.count)
        }
    }
    
    //MARK: - UICollectionViewDelegate method
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    //MARK: - UICollectionViewDataSource methods
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FEED_CELL_IDENTIFIER, for: indexPath)
        if let feedCell = cell as? FeedCollectionViewCell {
            let feedItem = self.feedItems[indexPath.row]
            feedCell.titleLabel.text = feedItem.title
            feedCell.fetchImage(with: feedItem.imageUrl.url)
        }
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1.0
        return cell
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout method
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        
        return CGSize(width: width/2, height: width/2)
    }
}

