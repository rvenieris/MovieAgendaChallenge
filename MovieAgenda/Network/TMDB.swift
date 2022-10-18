////
////  TMDB.swift
////  TMDBTestCM
////
////  Created by Ricardo Venieris on 30/07/19.
////  Copyright © 2019 Ricardo Venieris. All rights reserved.
////
//
//import Foundation
//
//class TMDB {
//    // -- MARK: Publics
//    
//    static let instance = TMDB()
//    
//
//    
//    private init(){
//        getAllGenres()
//    }
//    
//    func getAllGenres() {
//
//        var requestLink: String {
//            return "\(dataRequestUrlPrefix)/" +
//                "\(apiVersion)/" +
//                "genre/" +
//                "\(midiaType.rawValue)/" +
//                "list" +
//                "?api_key=\(key)" +
//            "&language=\(language.rawValue)"
//        }
//        
//        var requestData:Data? {
//            guard let data = try? Data(from: URL(requestLink) else {
//                debugPrint("Movies Data unreachable")
//                return nil
//            }
//            return data
//        }
//        
//        var requestResult:MDBGenres? {
//            return try? requestData?.convert(to: MDBGenresResult.self).genres
//        }
//        
//        for item in requestResult ?? [] {
//            self.genres[item.id] = item.name
//        }
//
//    }
//    
//    
//    
//    var page:Int {
//        get { return self._innerPage.limit(lower: 1, upper: lastMovieResult?.total_pages ?? Int.max) }
//        set { self._innerPage = newValue }
//    }
//    
//    
//    var requestLink: String {
//        return "\(dataRequestUrlPrefix)/" +
//            "\(apiVersion)/" +
//            "\(movieListType.rawValue)/" +
//            "\(midiaType.rawValue)" +
//            "?api_key=\(key)" +
//            "&language=\(language.rawValue)" +
//            "&sort_by=\(sortType.rawValue).\(sortOrder.rawValue)" +
//            "&include_video" +
//        "&page=\(page)"
//    }
//    
//    var requestData:Data? {
//        guard let data = try? Data(from: requestLink) else {
//            debugPrint("Movies Data unreachable")
//            return nil
//        }
//        return data
//    }
//    
//    var requestResult:MDBMovieResult? {
//        return try? requestData?.convert(to: MDBMovieResult.self)
//    }
//    
//    
//    
//    func getMoviesFor(page: Int)->MDBMovies {
//        
//        if let lastResult = self.lastMovieResult,
//            lastResult.page == page {
//            return lastResult.results
//        }
//        
//        
//        if let requestResult = requestResult {
//            self.lastMovieResult = requestResult
//            self.page = page
//            return requestResult.results
//        }
//        
//        // else, return empty
//        return MDBMovies()
//    }
//    
//    var currentPage:MDBMovies {
//        return self.getMoviesFor(page: self.page)
//    }
//    
//    var nextPage:MDBMovies {
//        return self.getMoviesFor(page: self.page + 1)
//    }
//    
//    var previousPage:MDBMovies {
//        return self.getMoviesFor(page: self.page - 1)
//    }
//    
//    
//}
