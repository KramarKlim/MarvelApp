//
//  HeroesListViewController.swift
//  MarvelApp
//
//  Created by Клим on 28.09.2021.
//

import UIKit

class HeroesListViewController: UIViewController {

    var model: HeroesListModelProtocol!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var allHeroesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = HeroesListModel()
        allHeroesCollectionView.register(UINib(nibName: "HeroesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "heroes")
        allHeroesCollectionView.delegate = self
        allHeroesCollectionView.dataSource = self
        getHeroes()
    }
    
    private func getHeroes() {
        model.fetchRequestForHeroes { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.allHeroesCollectionView.reloadData()
            }
        }
    }
}

extension HeroesListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.numberOfCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "heroes", for: indexPath) as! HeroesCollectionViewCell
        let hero = model.heroesModel(indexPath: indexPath)
        cell.model = hero
        return cell
    }
    
    
}
