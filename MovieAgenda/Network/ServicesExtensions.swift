//
//  ServicesExtensions.swift
//  MovieAgenda
//
//  Created by Ricardo Venieris on 18/10/22.
//

import Foundation
import CodableExtensions
    // MARK: - URLSession response handlers

public extension URLSession {
    var jSONDecoder:JSONDecoder {
        let decoder = JSONDecoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }
    
    var jSONEncoder:JSONEncoder {
        let encoder = JSONEncoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            encoder.dateEncodingStrategy = .iso8601
        }
        return encoder
    }

    func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? self.jSONDecoder.decode(T.self, from: data), response, nil)
        }
    }
    
    func mDBRequestTask(with url: URL, completionHandler: @escaping (MDBRequest?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
