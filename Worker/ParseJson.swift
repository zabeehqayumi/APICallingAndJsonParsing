//
//  ParseJson.swift
//  APICallingAndJsonParsing
//
//  Created by Zab on 11/5/20.
//

import Foundation

final class ParseJson {
    typealias success = (BookModel) -> ()
    static func jsonFile(bookName: String, onSuccess: @escaping success) {
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=\(bookName)")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(BookModel.self, from: data)
                onSuccess(json)
            } catch {
                print("json error")
            }
        }.resume()
    }
}
