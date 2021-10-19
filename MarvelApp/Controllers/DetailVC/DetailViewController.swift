//
//  DetailViewController.swift
//  MarvelApp
//
//  Created by Клим on 29.09.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: Public property
    var model: DetailModelProtocol!
    
    //MARK: IBOUTLETS
    @IBOutlet var heroImage: UIImageView!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var exploreCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exploreCollectionView.register(UINib(nibName: "ExploreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "explore")
        setup()
        exploreCollectionView.delegate = self
        exploreCollectionView.dataSource = self
    }
    
    //MARK: Private method
    private func setup() {
        heroImage.fetchImage(from: model.getImage())
        descLabel.text = model.getDesc()
        navigationItem.title = model.getName()
    }
}

//MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.number()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = exploreCollectionView.dequeueReusableCell(withReuseIdentifier: "explore", for: indexPath) as! ExploreCollectionViewCell
        let explore = model.exploreModel(indexPath: indexPath)
        cell.model = explore
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        exploreCollectionView.deselectItem(at: indexPath, animated: true)
        let call = exploreCollectionView.cellForItem(at: indexPath) as! ExploreCollectionViewCell
        let new = model.random[indexPath.row]
        descLabel.text = new.description
        navigationItem.title = new.name
        heroImage.image = call.heroImage.image
    }
}
