//
//  FeedView.swift
//  MovieAgenda
//
//  Created by Ricardo Venieris on 17/10/22.
//

import UIKit


class FeedView:UIView {
    let cellReuseIdentifier = "item"

    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.itemSize = CGSizeMake(30, 40)

        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)

        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        self.addSubview(collectionView)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let margins = self.layoutMarginsGuide
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        
        
        

    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
