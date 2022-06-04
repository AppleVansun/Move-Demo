//
//  FavoriteCell.swift
//  Movie Demo
//
//  Created by Ivan Grin on 2.06.22.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    @IBOutlet weak var favoriteImage: UIImageView!
    
    
    public func configure(with model: TvModel) {
        
        let url = URL(string: "https://image.tmdb.org/t/p/original" + model.posterTv)
        DispatchQueue.main.async {
            self.favoriteImage.kf.setImage(with: url)
//            self.label.text = model.movieTitle
//            self.reliseLabel.text = model.movieReleaseDate
            
        }
    }
}
