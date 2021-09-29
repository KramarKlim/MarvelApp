//
//  DetailModel.swift
//  MarvelApp
//
//  Created by Клим on 29.09.2021.
//

import Foundation

protocol DetailModelProtocol {
    var hero: Heroes { get }
    var random: [Heroes] { get }
    
    init(hero: Heroes, random: Set<Heroes>)
    
    func getDesc() -> String
    func getImage() -> String
    func getName() -> String
    func exploreModel(indexPath:IndexPath) -> ExploreModelProtocol?
}

class DetailModel: DetailModelProtocol {
    var hero: Heroes
    
    var random: [Heroes]
    
    required init(hero: Heroes, random: Set<Heroes>) {
        self.hero = hero
        self.random = Array(random)
    }
    
    func getDesc() -> String {
        hero.description ?? "Неизвестно"
    }
    
    func getImage() -> String {
        hero.thumbnail?.path ?? "Неизвестно"
    }
    
    func getName() -> String {
        hero.name ?? "Неизвестно"
    }
    
    func exploreModel(indexPath: IndexPath) -> ExploreModelProtocol? {
        guard let thum = random[indexPath.row].thumbnail else { return nil }
        return ExploreModel(image: thum)
    }
}
