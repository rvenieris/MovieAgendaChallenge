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
        
        // Fazer aqui, antes do viewDidLoad
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedView.collectionView.delegate = self
        feedView.collectionView.dataSource = self
        
        requestMovies(pages: 30)
    }

    func requestMovies(pages:Int = 1) {
        guard pages > 0 else {return}
        service.request(requestType: .dummy, then: { result in
            switch result {
                case .success(let request):
                    self.results.append(contentsOf: request.results)
//                    dump(self.results)
                    print(self.results.count, "de", request.totalResults)
                    self.requestMovies(pages: pages - 1)
                    guard pages == 1 else {return}
                    DispatchQueue.main.async {
                        self.feedView.collectionView.reloadData()
                    }
                case .failure(let error):
                    debugPrint(error)
            }
        })
        
    }

}


extension FeedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var detailViewController = DetailViewController(result: results[indexPath.row])
        detailViewController.modalPresentationStyle = .overFullScreen
        present(detailViewController, animated: true)
    }

}

extension FeedViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        let row = indexPath.row

        
        if row == results.count - 1 {
            print("***End***")
            requestMovies()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedView.cellReuseIdentifier, for: indexPath)
        
        guard let feedCell = cell as? FeedCollectionViewCell else {
            return cell
        }
        // decora
        feedCell.setUp(for: results[indexPath.row])
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
        // (750/500) == Image Original size proportion
        // (1/10) == Label size
        size.height = size.width * ( (750/500) + (1/10))
        return size
    }
}
