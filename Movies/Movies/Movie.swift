//
//  Movie.swift
//  Movies
//
//  Created by Kavinraj M on 01/05/21.
//

import Foundation
struct Movie: Codable {
    
    static let BaseURL = "http://image.tmdb.org/t/p/w92"
    
    let name: String?
    let originalName: String?
    let description: String?
    let imagePath: String?
    let detailImagePath: String?
    let releaseDate: String?
    let rating: Double?
    
    enum CodingKeys: String, CodingKey {
        case name = "title"
        case originalName = "original_title"
        case description = "overview"
        case imagePath = "poster_path"
        case detailImagePath = "backdrop_path"
        case releaseDate = "release_date"
        case rating = "vote_average"
    }

}

