//
//  CartoonsViewController.swift
//  Movie Demo
//
//  Created by Ivan Grin on 2.06.22.
//

import UIKit
import Kingfisher

class FavoriteViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var tvManager = TvManager()
    var tvModels = [TvModel]()
    
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteCollectionView.backgroundColor = .black
        tvManager.delegate = self
        tvManager.fetchMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = favoriteCollectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as! FavoriteCell
        cell.backgroundColor = .black
        let url = URL(string: "https://image.tmdb.org/t/p/original" + tvModels[indexPath.row].posterTv)
        cell.favoriteImage.kf.setImage(with: url)
        cell.favoriteImage.layer.cornerRadius = 40
        return cell
    }
    
   
    
}

extension FavoriteViewController: TVManagerDelegate {
    func didUpdateListOfTv(_ tvManager: TvManager, tv: [TvModel]) {
        self.tvModels = tv
        print(tv)
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
