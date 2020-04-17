//
//  MoviesController.swift
//  MoviesApp
//
//  Created by MTMAC17 on 17/04/20.
//  Copyright © 2020 Mitrais. All rights reserved.
//

import UIKit

class MoviesController: UIViewController {

    var genre: Genre = Genre(id: 0, name: "")
    var movies: [Movie] = []
    
    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var genreNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genreNameLabel.text = genre.name
        
        API.getMovies(genreId: genre.id, completion: { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let moviesResult):
                self.movies = moviesResult
                DispatchQueue.main.async {
                    self.moviesTableView.reloadData()
                }
            }
        })
    }
}

extension MoviesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell
        cell?.movieTitleLabel.text = movies[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "movieDetailController") as? MovieDetailController
        vc?.movieDetail = movies[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
