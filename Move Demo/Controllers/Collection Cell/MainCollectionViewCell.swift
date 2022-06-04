//
//  MainCollectionViewCell.swift
//  Movie Demo
//
//  Created by Ivan Grin on 3.06.22.
//

import UIKit
import Kingfisher

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var reliseLabel: UILabel!
    
    static let identifier = "MainCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "MainCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
    }
    
    
    public func configure(with model: MovieModel) {
        
        let url = URL(string: "https://image.tmdb.org/t/p/original" + model.poster)
        DispatchQueue.main.async {
            self.imageView.kf.setImage(with: url)
            self.label.text = model.movieTitle
            self.reliseLabel.text = model.movieReleaseDate
            
        }
    }
    
//    public func configureTV(with model: TvModel) {
//
//        let url = URL(string: "https://image.tmdb.org/t/p/original" + model.posterTv)
//        DispatchQueue.main.async {
//            self.imageView.kf.setImage(with: url)
//            self.label.text = model.tvTitle
//            self.reliseLabel.text = model.tvReleaseDate
//
//        }
//    }
}

