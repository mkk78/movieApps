//
//  Video.swift
//  MoviesApp
//
//  Created by MTMAC17 on 17/04/20.
//  Copyright © 2020 Mitrais. All rights reserved.
//

import Foundation

struct Video: Decodable {
    let id: String
    let name: String
    let key: String
    let site: String
    let type: String
}

struct VideoResults: Decodable {
    let results: [Video]
}
