//
//  ExploreCollectionViewCell.swift
//  MarvelApp
//
//  Created by Клим on 29.09.2021.
//

import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {
    
    var model: ExploreModelProtocol! {
        didSet {
            heroImage.fetchImage(from: model.getImage() + ".jpg")
        }
    }

    @IBOutlet var heroImage: UIImageView!
    
}
