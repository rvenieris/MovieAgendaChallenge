//
//  MDBRequest.swift
//  MovieAgenda
//
//  Created by Ricardo Venieris on 17/10/22.
//

    // This file was generated from JSON Schema using quicktype, do not modify it directly.
    // To parse the JSON, add this file to your project and do:
    //
    //   let mDBRequest = try? newJSONDecoder().decode(MDBRequest.self, from: jsonData)

    //
    // To read values from URLs:
    //
    //   let task = URLSession.shared.mDBRequestTask(with: url) { mDBRequest, response, error in
    //     if let mDBRequest = mDBRequest {
    //       ...
    //     }
    //   }
    //   task.resume()

import Foundation
import CodableExtensions

    // MARK: - MDBRequest
public struct MDBRequest: Codable {
    public let page: Int
    public let results: [MDBResult]
    public let totalPages: Int
    public let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
}

    //
    // To read values from URLs:
    //
    //   let task = URLSession.shared.resultTask(with: url) { result, response, error in
    //     if let result = result {
    //       ...
    //     }
    //   }
    //   task.resume()
