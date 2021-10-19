//
//  HeroesListViewController.swift
//  MarvelApp
//
//  Created by Клим on 28.09.2021.
//

import UIKit

class HeroesListViewController: UIViewController {

    //MARK: Public property
    var model: HeroesListModelProtocol!
    
    //MARK: IBOutlets
    @IBOutlet var allHeroesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = HeroesListModel()
        allHeroesCollectionView.register(UINib(nibName: "HeroesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "heroes")
        allHeroesCollectionView.delegate = self
        allHeroesCollectionView.dataSource = self
        getHeroes()
        setupTitle()
    }
    
    //MARK: Private methods
    private func setupTitle() {
        let logo = UIImage(named: "Vector")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
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

//MARK: UICollectionViewDelegate, UICollectionViewDataSource
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        allHeroesCollectionView.deselectItem(at: indexPath, animated: true)
        let detailModel = model.detailModel(indexPath: indexPath)
        performSegue(withIdentifier: "detail", sender: detailModel)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailViewController
        detailVC.model = sender as? DetailModelProtocol
        navigationItem.backButtonTitle = ""
    }
}
