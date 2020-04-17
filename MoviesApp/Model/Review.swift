//
//  Review.swift
//  MoviesApp
//
//  Created by MTMAC17 on 17/04/20.
//  Copyright © 2020 Mitrais. All rights reserved.
//

import Foundation

struct Review : Decodable{
    let id: String
    let author: String
    let content: String
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        case id, author, content, url
    }
}

struct ReviewResults: Decodable {
    let id: Int
    let page: Int
    let numResults: Int
    let numPages: Int
    let reviews: [Review]
    
    private enum CodingKeys: String, CodingKey {
        case id, page, numResults = "total_results", numPages = "total_pages", reviews = "results"
    }
}


