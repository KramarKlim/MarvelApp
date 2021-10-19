//
//  HeroesModel.swift
//  MarvelApp
//
//  Created by Клим on 28.09.2021.
//

import Foundation

protocol HeroesModelProtocol {
    var thum: Thumbnail { get }
    init(thum: Thumbnail)
    func getImage() -> String
}

class HeroesModel: HeroesModelProtocol {
    var thum: Thumbnail
    
    required init(thum: Thumbnail) {
        self.thum = thum
    }
    
    func getImage() -> String {
        return (thum.path ?? DataManager.shared.error) + "." + (thum.extension ?? DataManager.shared.error)
        
    }
}
