//
//  ReviewController.swift
//  MoviesApp
//
//  Created by MTMAC17 on 17/04/20.
//  Copyright © 2020 Mitrais. All rights reserved.
//

import UIKit

class ReviewController: UIViewController {

    var movieReview: Movie = Movie(id: 0, posterPath: "", backdrop: "", title: "", releaseDate: "", rating: 0, overview: "")
    
    var reviews: [Review] = []
    var reviewResult: ReviewResults = ReviewResults(id: 0, page: 0, numResults: 0, numPages: 0, reviews: [])
    
    var page: Int = 1
    var fetchingMore = false
    
    @IBOutlet weak var reviewTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        API.getReviews(movieId: movieReview.id, page: 1,  completion: { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let reviewResult):
                self.reviews = reviewResult.reviews
                DispatchQueue.main.async {
                    self.reviewTableView.reloadData()
                }
            }
        })
    }
}

extension ReviewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reviewTableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as? ReviewTableViewCell
        cell?.authorNameLabel.text = reviews[indexPath.row].author
        cell?.reviewContentTextView.text = reviews[indexPath.row].content
        
        return cell!
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if (offsetY > contentHeight - scrollView.frame.height) {
            if (!fetchingMore) {
                if (self.page < self.reviewResult.numPages) {
                    fetchData()
                }
            }
        }
    }
    
    func fetchData() {
        self.page += 1
        API.getReviews(movieId: movieReview.id, page: self.page,  completion: { result in
            self.fetchingMore = true
            switch result {
            case .failure(let error):
                print(error)
            case .success(let reviewResult):
                self.reviews = reviewResult.reviews
                DispatchQueue.main.async {
                    self.reviewTableView.reloadData()
                }
                self.fetchingMore = false
            }
        })
    }
    
}
