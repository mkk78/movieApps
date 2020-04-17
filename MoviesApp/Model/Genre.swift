//
//  Genre.swift
//  MoviesApp
//
//  Created by MTMAC17 on 17/04/20.
//  Copyright © 2020 Mitrais. All rights reserved.
//

import Foundation

struct Genre: Decodable {
    let id: Int
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name
    }
}

struct GenreResults: Decodable {
    let genres: [Genre]
    
    private enum CodingKeys: String, CodingKey {
        case genres
    }
}
