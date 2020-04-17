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
    static let apiKey = ""
    
    static let baseUrl = "https://api.themoviedb.org/3/"
    static let imageUrl = "https://image.tmdb.org/t/p/original/"
    
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
                completion(.success(genres))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        } )
        task.resume()
    }
    
    
    static func getMovies(genreId: Int, completion: @escaping(Result<[Movie], APIError>) -> Void) {
        let session = URLSession.shared
        var newUrl = baseUrl + "discover/movie?" + "with_genres=\(genreId)"
        newUrl += "&api_key=" + apiKey
        let url = URL(string: newUrl)!
        
        let task = session.dataTask(with: url, completionHandler: {data, response, error in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let response = try JSONDecoder().decode(MovieResults.self, from: jsonData)
                let movies = response.movies
                completion(.success(movies))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        } )
        task.resume()
    }
    
    static func getReviews(movieId: Int, page: Int, completion: @escaping(Result<ReviewResults, APIError>) -> Void) {
        let session = URLSession.shared
        var newUrl = baseUrl + "movie/\(movieId)/reviews?" + "page=\(page)"
        newUrl += "&api_key=" + apiKey
        let url = URL(string: newUrl)!
        
        let task = session.dataTask(with: url, completionHandler: {data, response, error in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let response = try JSONDecoder().decode(ReviewResults.self, from: jsonData)
                completion(.success(response))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        } )
        task.resume()
    }
}
