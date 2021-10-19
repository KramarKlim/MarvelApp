//
//  HeroesCollectionViewCell.swift
//  MarvelApp
//
//  Created by Клим on 28.09.2021.
//

import UIKit

class HeroesCollectionViewCell: UICollectionViewCell {
    
    var model: HeroesModelProtocol! {
        didSet {
            heroImage.fetchImage(from: model.getImage())
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        heroImage.image = nil
    }

    @IBOutlet var heroImage: UIImageView!
    
}
