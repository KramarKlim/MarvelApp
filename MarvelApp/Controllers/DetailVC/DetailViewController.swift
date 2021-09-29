//
//  DetailViewController.swift
//  MarvelApp
//
//  Created by Клим on 29.09.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var model: DetailModelProtocol!
    
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
    
    private func setup() {
        heroImage.fetchImage(from: model.getImage() + ".jpg")
        descLabel.text = model.getDesc()
        navigationItem.title = model.getName()
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = exploreCollectionView.dequeueReusableCell(withReuseIdentifier: "explore", for: indexPath) as! ExploreCollectionViewCell
        let explore = model.exploreModel(indexPath: indexPath)
        cell.model = explore
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        exploreCollectionView.deselectItem(at: indexPath, animated: true)
//        let a = model.random[indexPath.row]
//        exploreCollectionView.reloadData()
//        descLabel.text = a.description ?? "Неизвестно"
//        heroImage.fetchImage(from: a.thumbnail?.path ?? "" + ".jpg")
//    }
}
