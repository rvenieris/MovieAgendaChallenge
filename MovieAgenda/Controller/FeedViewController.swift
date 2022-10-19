//
//  ViewController.swift
//  MovieAgenda
//
//  Created by Ricardo Venieris on 17/10/22.
//

import UIKit

class FeedViewController: UIViewController {

    let service = TMDBService(apiKey: tmdbKey)
    var results:[MDBResult] = []
    var feedView:FeedView {view as! FeedView}
    
    
    override func loadView() {
        super.loadView()
        view = FeedView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedView.collectionView.delegate = self
        feedView.collectionView.dataSource = self
        
        requestMovies()
    }

    func requestMovies() {
        service.request(requestType: .trendingAllWeek, then: { result in
            switch result {
                case .success(let request):
                    self.results = request.results
                    print(request.results.count, "de", request.totalResults)
                    request.results.forEach {item in
                        print(item.name ?? "No name", item.posterPath ?? "noCover")
                    }
                case .failure(let error):
                    debugPrint(error)
            }
        })
        
    }

}


extension FeedViewController: UICollectionViewDelegate {

}

extension FeedViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedView.cellReuseIdentifier, for: indexPath)
        
        guard let feedCell = cell as? FeedCollectionViewCell else {
            cell.backgroundColor = .yellow
            return cell
        }
        
        // decora
        feedCell.label.text = "123 Testando \(indexPath.row)"
        return feedCell
    }
    
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = feedView.collectionView.frame.size
        let step = indexPath.row - 6
        if step%7 != 0 { // small
            size.width = size.width / 3.2
            
        }
        size.height = size.width * ( (16/9) + (1/10))
        return size
    }
}
