//
//  Move Manager.swift
//  Move Demo
//
//  Created by Ivan Grin on 1.06.22.
//

import Foundation


protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    var delegate : WeatherManagerDelegate?
    let wetherURL = "https://api.themoviedb.org/3/discover/movie?api_key=e9d089d86a9be0071f7eb06ee44c9a88&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate#"
    // key: e9d089d86a9be0071f7eb06ee44c9a88
    // example: https://api.themoviedb.org/3/discover/movie?api_key=e9d089d86a9be0071f7eb06ee44c9a88&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate#
    
    func fetchWether (cityName: String) {
        let stringURL = wetherURL + "q=" + cityName
        performRequest(with: stringURL)
        print(stringURL)
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
                    if let weather = self.parseJSON(safeData){
                        delegate?.didUpdateWeather(self, weather: weather)
                        print(weather)
                    }
                }
            }
            sessionTask.resume()
        }
    }
    
    func parseJSON (_ data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decoderedData = try decoder.decode(WeatherData.self, from: data)
            let id = decoderedData.weather[0].id
            let city = decoderedData.name
            let temp = decoderedData.main.temp
            let weatherModel = WeatherModel(cityName: city, temperature: temp, conditionId: id)
            return weatherModel
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
