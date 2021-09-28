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
        return thum.path ?? "https://pbs.twimg.com/profile_images/1246149074132381697/GFKfka5v_400x400.jpg"
    }
    
    
}
