//
//  CollectionViewController.swift
//  GenericCollectionViewCell
//
//  Created by Diogo Tridapalli on 1/31/16.
//  Copyright © 2016 Diogo Tridapalli. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        if let collectionView = self.collectionView {

            collectionView.backgroundColor = UIColor.whiteColor()
            // Register cell classes
            collectionView.registerClass(CollectionViewCell<UILabel, String>.self, forCellWithReuseIdentifier: reuseIdentifier)
        }

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 5
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)

        if let cell = cell as? CollectionViewCell<UILabel, String> {
            let max = collectionView.numberOfItemsInSection(indexPath.section)
            cell.model = "Cell \(indexPath.row+1)/\(max)"
        }

        return cell
    }

    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        let width = collectionView.bounds.size.width
        let height = CGRectGetHeight(self.view.bounds)
        let contentInset = collectionView.contentInset

        let size = CGSizeMake(width - contentInset.right - contentInset.left,
            height);

        return size;
        
    }
}

extension UILabel: HasModel {

    var model: String {
        get {
            return text ?? ""
        }
        set(newModel) {
            text = newModel
            textAlignment = .Center
        }
    }
}

