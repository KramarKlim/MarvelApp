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
            heroImage.fetchImage(from: model.getImage() + ".jpg")
        }
    }

    @IBOutlet var heroImage: UIImageView!
    
}
