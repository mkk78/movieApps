//
//  ViewController.swift
//  MoviesApp
//
//  Created by MTMAC17 on 16/04/20.
//  Copyright © 2020 Mitrais. All rights reserved.
//

import UIKit

class GenresController: UIViewController {

    var genres: [Genre] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        API.getGenres(completion: { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let genresResult):
                self.genres = genresResult
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    }
}

extension GenresController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GenreTableViewCell
        cell?.genreCellLabel.text = genres[indexPath.row].name
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "moviesController") as? MoviesController
        vc?.genre = genres[indexPath.row]
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
