    //
    //  FeedCollectionViewCell.swift
    //  MovieAgenda
    //
    //  Created by Ricardo Venieris on 18/10/22.
    //

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {

    let imageView:UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "film", withConfiguration: UIImage.SymbolConfiguration(weight: .light))
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.backgroundColor = .lightGray
        return view
    }()
    
    let label:UILabel = {
        let label = UILabel()
        label.text = "No Title"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = NSTextAlignment(.center)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        return label
    }()
    
    
    override init(frame: CGRect) {
        print(frame)
        super.init(frame: frame)
            // add subviews
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        
     
        
        label.translatesAutoresizingMaskIntoConstraints=false
        label.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.1).isActive = true
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 3).isActive = true

        imageView.translatesAutoresizingMaskIntoConstraints=false
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(lessThanOrEqualTo: label.topAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    func setUp(for item:MDBResult) {
        self.label.text = item.title ?? item.name ?? item.originalTitle ?? item.originalName ?? "No Title"
        
        var partsOfTitle: [String] = []
        // Removing big titles by only including what comes before ":"
        partsOfTitle = label.text!.components(separatedBy: ":")
        self.label.text = partsOfTitle.first!

        
        TMDBService.defaultInstance.requestImage(from: item.posterPath, then: {result in
            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                case .failure(let error):
                    debugPrint(error)
            }

        })
    }
    
}
