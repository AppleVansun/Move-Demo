//
//  Move Model.swift
//  Move Demo
//
//  Created by Ivan Grin on 1.06.22.
//

import Foundation

struct WeatherModel {
    let cityName : String
    let temperature : Double
    let conditionId : Int
    
    var stringTemperature : String {
        return String(format: "%.1f", temperature)
    }
}

struct MovieModel {
    
}

