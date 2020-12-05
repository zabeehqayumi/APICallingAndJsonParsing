//
//  SearchViewModel.swift
//  APICallingAndJsonParsing
//
//  Created by Zab on 11/5/20.
//

import Foundation


protocol HomeViewModelDelegate: class {
    func booksUpdated()
}

class SearchViewModel {
    
    var books: BookModel?
    
    weak var delegate: HomeViewModelDelegate?

    func search(text: String) {
        ParseJson.jsonFile(bookName: text) { [weak self] books in
            //self?.books = books
            self?.books = books
            self?.delegate?.booksUpdated()
        }
    }
    
    func getBookTitle(at index: Int) -> String? {
        let bookName = books?.items?.object(at: index)?.volumeInfo?.title
        return bookName ?? ""
    }
    
    func getNumberOfBooks() -> Int? {
        return books?.items?.count ?? 0
    }
    
    func getBookSubtitle(at index: Int) -> String? {
        let bookSubtitle = books?.items?.object(at: index)?.volumeInfo?.subtitle
        return bookSubtitle ?? ""
    }
    
    func getBookThumbnail(at index: Int) -> String? {
        let thumbnail = books?.items?.object(at: index)?.volumeInfo?.imageLinks?.thumbnail
        return thumbnail ?? ""
    }
    
    func getAuthorName(at index: Int) -> String? {
        let author = books?.items?.object(at: index)?.volumeInfo?.authors?.first
        return author ?? ""
    }
    
    func favoriteBookNameAtIndexPath(bookName: String) {
        
        var favoritesList = [String]()
        let defaults = UserDefaults.standard
        
        if let favoriteDefaults = defaults.object(forKey: "favorites") {
            favoritesList = favoriteDefaults as? [String] ?? []
        }
        
        favoritesList.append(bookName)
        defaults.set(favoritesList, forKey: "favorites")
        defaults.synchronize()
    }
    
    func favoriteImageLink(imageUrl: String) {
        var imageList = [String]()
        let defaults = UserDefaults.standard
        
        if let imageDefautls = defaults.object(forKey: "imageStrings") {
            imageList = imageDefautls as? [String] ?? []
        }
        
        imageList.append(imageUrl)
        defaults.set(imageList, forKey: "imageStrings")
        defaults.synchronize()
    }
}
