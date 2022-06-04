//
//  Move data.swift
//  Move Demo
//
//  Created by Ivan Grin on 1.06.22.
//

import Foundation

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
