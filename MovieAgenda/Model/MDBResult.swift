    //
    //  MDBMovies.swift
    //  MovieConsultor
    //
    //  Created by Ricardo Venieris on 24/05/18.
    //  Copyright © 2018 LES.PUC-RIO. All rights reserved.
    //

import Foundation
    //import CodableExtensions

    // MARK: - Result
public struct MDBResult: Codable, Identifiable {
    
    static private let imageUrlPrefix = "https://image.tmdb.org/t/p/w500"
    
    
    public var id: Int
    public var name: String?
    public var overview: String?
    public let originalTitle: String?
    public var posterPath: String?
    public var backdropPath: String?
    public var mediaType: MediaType
    public var genreIDS: [Int]?
    public var voteAverage: Double
    public var voteCount: Int
    
    public var posterURL: URL? {return fullImagePath(for: posterPath)}
    public var backdropURL: URL?  {return fullImagePath(for: backdropPath)}
    
    public var adult: Bool?
    public let title: String?
    public let releaseDate: String?
    public let video: Bool?
    public let originalLanguage: String?
    public let originalName: String?
    public let popularity: Double?
    public let firstAirDate: String?
    public let originCountry: [String]?
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case id = "id"
        case name = "name"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity = "popularity"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
        case title = "title"
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case video = "video"
    }
    
    
    private func fullImagePath(for image:String?)->URL? {
        guard let image = image,
              let url = URL(string: Self.imageUrlPrefix+image) else {return nil}
        return url
    }
}

public enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}
