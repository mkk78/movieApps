//
//  MovieDetailController.swift
//  MoviesApp
//
//  Created by MTMAC17 on 17/04/20.
//  Copyright © 2020 Mitrais. All rights reserved.
//

import UIKit

class MovieDetailController: UIViewController {

    var movieDetail: Movie = Movie(id: 0, posterPath: "", backdrop: "", title: "", releaseDate: "", rating: 0, overview: "")
    
    @IBOutlet weak var movieTitleDetailLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitleDetailLabel.text = movieDetail.title
        releaseDateLabel.text = movieDetail.releaseDate
        ratingTitle.text = "\(movieDetail.rating)"
    }
    
    @IBAction func seeReviewAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "reviewController") as? ReviewController
        vc?.movieReview = movieDetail
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func watchTrailerAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "videoDetailController") as? VideoController
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
