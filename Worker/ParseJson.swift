//
//  ParseJson.swift
//  APICallingAndJsonParsing
//
//  Created by Zab on 11/5/20.
//

import Foundation
import UIKit

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
    
    static func downloadImage(url: String, completion: @escaping (UIImage?) ->()) {
        let url = URL(string: url)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse,
                  httpURLResponse.statusCode == 200,
                  let data = data, error == nil,
                  let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }.resume()
        
    }
}
