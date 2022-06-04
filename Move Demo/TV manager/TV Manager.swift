//
//  Move Manager.swift
//  Move Demo
//
//  Created by Ivan Grin on 1.06.22.
//

import Foundation


protocol TVManagerDelegate {
    func didUpdateListOfTv(_ tvManager: TvManager, tv: [TvModel])
    func didFailWithError(error: Error)
}

struct TvManager {
    
    var delegate : TVManagerDelegate?
    let movieURL =
    "https://api.themoviedb.org/3/discover/tv?api_key=e9d089d86a9be0071f7eb06ee44c9a88&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=false&with_watch_monetization_types=flatrate&with_status=0&with_type=0"
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
                        delegate?.didUpdateListOfTv(self, tv: results)
                        //print(results[0])
                    }
                }
            }
            sessionTask.resume()
        }
    }
    
    func parseJSON (_ data: Data) -> [TvModel]? {
        let decoder = JSONDecoder()
        do {
            let decoderedData = try decoder.decode(TvData.self, from: data)
            
            var tvModels = [TvModel]()
            
            for each in decoderedData.results {
                let name = each.name
                let reliseDate = each.first_air_date
                let poster = each.poster_path
                let temp = TvModel(tvTitle: name, posterTv: poster ?? "/rRWsly2bqP21XZdNB0QbaB1cZV1.jpg", tvReleaseDate: reliseDate)
                tvModels.append(temp)
            }
            //print(tvModels)
            return tvModels
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
