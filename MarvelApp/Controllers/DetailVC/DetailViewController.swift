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

    }
  

}
