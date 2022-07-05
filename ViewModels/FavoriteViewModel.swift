//
//  FavoriteViewModel.swift
//  APICallingAndJsonParsing
//
//  Created by Zab on 11/5/20.
//

import Foundation
import UIKit

class FavoriteViewModel {
    var favorites = [String]()
    var favoritesImagesArray = [String]()
    
    func fetchingBookNames() {
        let defaults = UserDefaults.standard
        if let favoritedData = defaults.object(forKey: "favorites") {
            favorites = favoritedData as? [String] ?? []
        }
    }
    
    func refreshData() {
        favorites = []
        fetchingBookNames()
        fetchBooksImageString()
    }
    
    func fetchBooksImageString() {
        let defaults = UserDefaults.standard
        if let favoritedImages = defaults.object(forKey: "imageStrings") {
            favoritesImagesArray = favoritedImages as? [String] ?? []
        }
    }
}
