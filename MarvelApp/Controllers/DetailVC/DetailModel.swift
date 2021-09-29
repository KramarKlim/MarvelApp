//
//  DetailModel.swift
//  MarvelApp
//
//  Created by Клим on 29.09.2021.
//

import Foundation

protocol DetailModelProtocol {
    var hero: Heroes { get }
    
    init(hero: Heroes)
    
    func getDesc() -> String
    func getImage() -> String
}

class DetailModel: DetailModelProtocol {
    var hero: Heroes
    
    required init(hero: Heroes) {
        self.hero = hero
    }
    
    func getDesc() -> String {
        hero.description ?? "Неизвестно"
    }
    
    func getImage() -> String {
        hero.thumbnail?.path ?? "Неизвестно"
    }
    
}
