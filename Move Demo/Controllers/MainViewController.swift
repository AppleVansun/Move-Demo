//
//  MainViewController.swift
//  Movie Demo
//
//  Created by Ivan Grin on 3.06.22.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
       
    @IBOutlet var mainTable: UITableView!
    
    
    var moviesManager = MoviesManager()
    var movieModels = [MovieModel]()
    var countTC = 3
    var countCC = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        mainTable.register(MainTableViewCell.nib(), forCellReuseIdentifier: MainTableViewCell.identifier)
        mainTable.delegate = self
        mainTable.dataSource = self
        moviesManager.delegate = self
        moviesManager.fetchMovies()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countTC
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTable.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        cell.configure(with: movieModels)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400.0
    }

}


//MARK: - Manager Delegate ext
extension MainViewController: MovieManagerDelegate {
    func didUpdateListOfMovies(_ movieManager: MoviesManager, movies: [MovieModel]) {
        countCC = movies.count
        //self.movieModels = movies
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
