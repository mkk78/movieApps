//
//  API.swift
//  MoviesApp
//
//  Created by MTMAC17 on 16/04/20.
//  Copyright © 2020 Mitrais. All rights reserved.
//

import Foundation
import Moya

enum APIError: Error {
    case noDataAvailable
    case canNotProcessData
}

class API {
    static let apiKey = "";
    
    static let baseUrl = "https://api.themoviedb.org/3/"
    
    static func getGenres(completion: @escaping(Result<[Genre], APIError>) -> Void) {
        let session = URLSession.shared
        let newUrl = baseUrl + "genre/movie/list?" + "api_key=" + apiKey
        let url = URL(string: newUrl)!
        
        let task = session.dataTask(with: url, completionHandler: {data, response, error in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let response = try JSONDecoder().decode(GenreResults.self, from: jsonData)
                let genres = response.genres
                print(genres)
                completion(.success(genres))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        } )
        task.resume()
    }
}
