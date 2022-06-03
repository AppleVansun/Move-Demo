//
//  Move Manager.swift
//  Move Demo
//
//  Created by Ivan Grin on 1.06.22.
//

import Foundation


protocol MovieManagerDelegate {
    func didUpdateListOfMovies(_ movieManager: MoviesManager, movies: [MovieModel])
    func didFailWithError(error: Error)
}

struct MoviesManager {
    
    var delegate : MovieManagerDelegate?
    let movieURL = "https://api.themoviedb.org/3/discover/movie?api_key=e9d089d86a9be0071f7eb06ee44c9a88&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate#"
    // key: e9d089d86a9be0071f7eb06ee44c9a88
    func fetchMovies () {
        let stringURL = movieURL
        performRequest(with: stringURL)
        //print(stringURL)
    }
    
    
    
    
    func performRequest (with stringURL: String) {
        // 1. Сreate URL
        if let url = URL(string: stringURL) {
            // 2. Create URLSession
            let session = URLSession(configuration: .default)
            // 3. Create Session Task
            let sessionTask = session.dataTask(with: url) { data, responce, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let results = self.parseJSON(safeData){
                        delegate?.didUpdateListOfMovies(self, movies: results)
                        //print(results[0])
                    }
                }
            }
            sessionTask.resume()
        }
    }
    
    func parseJSON (_ data: Data) -> [MovieModel]? {
        let decoder = JSONDecoder()
        do {
            let decoderedData = try decoder.decode(MovieData.self, from: data)
            
            var moviesModels = [MovieModel]()
            
            for each in decoderedData.results {
                
                let name = each.title
                //SaveDataMovie.movieTitle.append(each.title)
                
                let reliseDate = each.release_date
                //SaveDataMovie.movieReleaseDate.append(each.release_date)
                
                let movieDescription = each.overview
                //SaveDataMovie.movieOverview.append(each.overview)
                
                let popularity = each.popularity
                //SaveDataMovie.moviePopularity.append(each.popularity)
                
                let poster = each.poster_path
                //SaveDataMovie.poster.append(each.poster_path)
                
                let temp = MovieModel(movieTitle: name, movieOverview: movieDescription, moviePopularity: popularity, poster: poster, movieReleaseDate: reliseDate)
                moviesModels.append(temp)
            }
            return moviesModels
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
