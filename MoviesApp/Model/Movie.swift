//
//  Movie.swift
//  MoviesApp
//
//  Created by MTMAC17 on 16/04/20.
//  Copyright © 2020 Mitrais. All rights reserved.
//

import Foundation


struct Movie: Decodable {
    let id: Int!
    let posterPath: String
    let videoPath: String?
    let backdrop: String
    let title: String
    let releaseDate: String
    let rating: Double
    let overview: String
    
    private enum CodingKeys: String, CodingKey {
        case id, posterPath = "poster_path", videoPath, backdrop = "backdrop_path", title, releaseDate = "release_date", rating = "vote_average", overview
    }
}

struct APIResults: Decodable {
    let page: Int
    let numResults: Int
    let numPages: Int
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case page, numResults = "total_results", numPages = "total_pages", movies = "results"
    }
}


