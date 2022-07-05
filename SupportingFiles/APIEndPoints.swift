//
//  APIEndPoints.swift
//  APICallingAndJsonParsing
//
//  Created by Zab on 7/4/22.
//

import Foundation

public enum APIEndPoints: String {
    
    var baseURL: String {
        return "https://www.googleapis.com/books/v1/volumes?q="
    }
    
    case baseBook = ""
    case dummy = "/dummy"
    
    var url: URL {
        guard let url = URL(string: baseURL) else {
            preconditionFailure("The URL used in \(APIEndPoints.self) is not valid. ")
        }
        return url.appendingPathComponent(self.rawValue)
    }
}

public struct ConstantAPI {
    static let books = "https://www.googleapis.com/books/v1/volumes?q="
}

