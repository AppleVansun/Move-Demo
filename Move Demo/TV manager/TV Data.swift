//
//  Move data.swift
//  Move Demo
//
//  Created by Ivan Grin on 1.06.22.
//

import Foundation

struct TvData: Decodable {
    let results: [TvResults]
}

struct TvResults: Decodable {
    let name: String
    let poster_path: String?
    let first_air_date: String
}
