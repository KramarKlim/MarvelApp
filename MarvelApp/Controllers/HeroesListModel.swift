//
//  HeroesListModel.swift
//  MarvelApp
//
//  Created by Клим on 28.09.2021.
//

import Foundation

protocol HeroesListModelProtocol {
    var list: [Heroes] { get }
    
    func fetchRequestForHeroes(completion: @escaping () -> Void)
    func numberOfCell() -> Int
    func heroesModel(indexPath: IndexPath) -> HeroesModelProtocol?
}

class HeroesListModel: HeroesListModelProtocol {
    var list: [Heroes] = []
    
    func fetchRequestForHeroes(completion: @escaping () -> Void) {
        RequestNetwork.shared.fetchNetwork(string: DataManager.shared.url, expecting: [Heroes].self) { heroes in
            self.list = heroes
            completion()
        }
    }
    
    func numberOfCell() -> Int {
        list.count
    }
    
    func heroesModel(indexPath: IndexPath) -> HeroesModelProtocol? {
        guard let hero = list[indexPath.row].thumbnail else { return nil }
        return HeroesModel(thum: hero)
    }
}
