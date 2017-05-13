//
//  FeedViewController.swift
//  Flicky
//
//  Created by Andrew Brandt on 5/13/17.
//  Copyright © 2017 Hello World. All rights reserved.
//

import UIKit

let FEED_CELL_IDENTIFIER = "FeedCollectionViewCell"

class FeedViewController: UICollectionViewController {

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
    
    //MARK: - UICollectionViewDataSource methods
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FEED_CELL_IDENTIFIER, for: indexPath)
        return cell
    }
}

