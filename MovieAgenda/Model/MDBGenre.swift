//
//  MDBGenre.swift
//  MyTMDBCollectionView
//
//  Created by Ricardo Venieris on 28/07/19.
//  Copyright © 2019 Ricardo Venieris. All rights reserved.
//

import Foundation

typealias MDBGenres = [MDBGenre]
struct MDBGenre: Codable {
    let id: Int
    let name: String    
}
