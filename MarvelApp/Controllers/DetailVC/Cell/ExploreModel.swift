//
//  ExploreModel.swift
//  MarvelApp
//
//  Created by Клим on 29.09.2021.
//

import Foundation

protocol ExploreModelProtocol {
    var image: Thumbnail { get }
    
    init(image: Thumbnail)
    
    func getImage() -> String
}

class ExploreModel: ExploreModelProtocol {
    var image: Thumbnail
    
    required init(image: Thumbnail) {
        self.image = image
    }
    
    func getImage() -> String {
        return (image.path ?? DataManager.shared.error) + "." + (image.extension ?? DataManager.shared.error)
    }
    
    
}
