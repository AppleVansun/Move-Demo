//
//  Move data.swift
//  Move Demo
//
//  Created by Ivan Grin on 1.06.22.
//

import Foundation

struct WeatherData: Decodable {
    
    let name : String
    let main : Main
    let weather: [Weather]
    
}

struct Main: Decodable {
    
    let temp : Double
}

struct Weather: Decodable {
    //weather[0].description
    let description : String
    let id : Int
}

struct MovieData: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let title: String
}
