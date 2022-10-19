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
        view.image = UIImage(systemName: "film", withConfiguration:UIImage.SymbolConfiguration(weight: .light))
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.backgroundColor = .lightGray
        return view
    }()
    
    let label:UILabel = {
        let label = UILabel()
        label.text = "No Title"
        label.font = UIFont.systemFont(ofSize: 40)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.textColor = .magenta
        label.tintColor = .red
        label.backgroundColor = .green
        return label
    }()
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
            // add subviews
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        print(frame)

        label.translatesAutoresizingMaskIntoConstraints=false
        label.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.1).isActive = true

        imageView.translatesAutoresizingMaskIntoConstraints=false
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: label.topAnchor).isActive = true


    }
    
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    func setUp(for item:MDBResult) {
        self.label.text = item.name ?? "No Title"
        
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
