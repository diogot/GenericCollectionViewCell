//
//  CollectionViewCell.swift
//  GenericCollectionViewCell
//
//  Created by Diogo Tridapalli on 1/31/16.
//  Copyright © 2016 Diogo Tridapalli. All rights reserved.
//

import UIKit

protocol HasModel {
    typealias Model
    var model: Model { get set }
}

class CollectionViewCell<View: UIView, ViewModel where View: HasModel, View.Model == ViewModel>: UICollectionViewCell {

    private(set) var customView: View

    override init(frame: CGRect)
    {
        customView = View()

        super.init(frame: frame)
        contentView.addSubview(customView)

        customView.frame = contentView.bounds
        customView.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    // The final here is necessary and it's related to this https://developer.apple.com/swift/blog/?id=27
    final var model: ViewModel {
        get {
            return customView.model
        }

        set(newModel) {
            customView.model = newModel
        }
    }
}
