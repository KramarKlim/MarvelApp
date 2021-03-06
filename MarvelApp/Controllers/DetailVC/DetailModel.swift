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
    func number() -> Int
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
        return (hero.thumbnail?.path ?? DataManager.shared.error) + "." + (hero.thumbnail?.extension ?? DataManager.shared.error)
    }
    
    func getName() -> String {
        hero.name ?? "Неизвестно"
    }
    
    func exploreModel(indexPath: IndexPath) -> ExploreModelProtocol? {
        guard let thum = random[indexPath.row].thumbnail else { return nil }
        return ExploreModel(image: thum)
    }
    
    func number() -> Int {
        if random.count < 10 {
            return random.count
        } else {
            return random[0...9].count
        }
    }
}
