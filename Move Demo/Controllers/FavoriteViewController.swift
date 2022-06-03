//
//  CartoonsViewController.swift
//  Movie Demo
//
//  Created by Ivan Grin on 2.06.22.
//

import UIKit
import Kingfisher

class FavoriteViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = favoriteCollectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as! FavoriteCell
        cell.backgroundColor = .black
        let url = URL(string: "https://image.tmdb.org/t/p/original" + "/jrgifaYeUtTnaH7NF5Drkgjg2MB.jpg")
        cell.favoriteImage.kf.setImage(with: url)
        cell.favoriteImage.layer.cornerRadius = 40
        
        
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteCollectionView.backgroundColor = .black
     
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
