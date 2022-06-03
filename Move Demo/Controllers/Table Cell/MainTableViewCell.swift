//
//  MainTableViewCell.swift
//  Movie Demo
//
//  Created by Ivan Grin on 3.06.22.
//

import UIKit

class MainTableViewCell: UITableViewCell{
    
    
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    static let identifier = "MainTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MainTableViewCell", bundle: nil)
    }
    
    var moviesManager = MoviesManager()
    
    var moveModels = [MovieModel]()
    
    func configure(with model: [MovieModel]){
        moveModels = model
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(MainCollectionViewCell.nib(), forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        moviesManager.delegate = self
        moviesManager.fetchMovies()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

   
}


//MARK: - Collection Delegate

extension MainTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        moveModels.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        cell.configure(with: moveModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 350)
    }
}


extension MainTableViewCell: MovieManagerDelegate {
    
    func didUpdateListOfMovies(_ movieManager: MoviesManager, movies: [MovieModel]) {
        self.moveModels = movies
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
