//
//  DetailViewController.swift
//  MovieAgenda
//
//  Created by Ricardo Venieris on 19/10/22.
//

import UIKit

class DetailViewController: UIViewController {
    let result:MDBResult
    
    let detailView: DetailView
    
    init(result: MDBResult) {
        self.result = result
        self.detailView = DetailView(result: result)
        super.init(nibName: nil, bundle: nil)
       
    }
    
    required init?(coder: NSCoder) {
      fatalError("f total")
    }
    
    override func loadView() {
        super.loadView()
        view = detailView
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.view as? DetailView)?.scrollView.delegate = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension DetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let startingPoint:CGFloat = detailView.scrollWarning.frame.size.height
        let finalPoint:CGFloat = startingPoint + 50
        
        detailView.scrollWarning.alpha = (scrollView.contentOffset.y > -startingPoint) ? 0 : (-scrollView.contentOffset.y - startingPoint)/(finalPoint + startingPoint)
        if scrollView.contentOffset.y <= -finalPoint {
            detailView.scrollWarning.text = "Release to Dismiss"
            detailView.scrollWarning.textColor = UIColor.red
            detailView.scrollWarning.alpha = 1
        }
        
        else {
            detailView.scrollWarning.text = "Scroll Down to Dismiss"
            detailView.scrollWarning.textColor = UIColor.black
        }
        
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let startingPoint:CGFloat = detailView.scrollWarning.frame.size.height
        let finalPoint:CGFloat = startingPoint + 50
        
        if scrollView.contentOffset.y <= -finalPoint {
            self.dismiss(animated: true)
        }
    }
}
