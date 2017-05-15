//
//  FeedDetailCollectionViewController.swift
//  Flicky
//
//  Created by Andrew Brandt on 5/14/17.
//  Copyright © 2017 Hello World. All rights reserved.
//

import UIKit



class FeedDetailCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var item: FlickerFeedItem? {
        didSet {
        
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.register(UINib(nibName: FEED_CELL_IDENTIFIER, bundle: nil), forCellWithReuseIdentifier: FEED_CELL_IDENTIFIER)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FEED_CELL_IDENTIFIER, for: indexPath)
        if let feedCell = cell as? FeedCollectionViewCell, let feedItem = self.item {
            feedCell.titleLabel.text = feedItem.title
            feedCell.fetchImage(with: feedItem.imageUrl.url, showDimensions: false)
        }
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1.0
        return cell
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout method
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height/2)
    }

}
