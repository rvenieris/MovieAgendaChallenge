//
//  ViewController.swift
//  MovieAgenda
//
//  Created by Ricardo Venieris on 17/10/22.
//

import UIKit

class FeedViewController: UIViewController {

    let service = TMDBService(apiKey: tmdbKey)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        requestMovies()
    }

    
    func requestMovies() {
//        let url = service.getURL(for: .trendingTvWeek)
//        print(url)
        service.request(requestType: .trendingTvWeek, then: { result in
            switch result {
                case .success(let request):
                    print(request.results.count, "de", request.totalResults)
                case .failure(let error):
                    debugPrint(error)
            }
        })
        
    }

}

