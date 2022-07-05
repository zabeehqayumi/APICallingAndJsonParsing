//
//  SearchViewController.swift
//  APICallingAndJsonParsing
//
//  Created by Zab on 11/5/20.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {
    
    @IBOutlet weak var booksSearchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    let activityView = UIActivityIndicatorView(style: .large)

    lazy var viewModel = SearchViewModel()
    var imagesArray = [String]()
    var imageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchTableView.delegate = self
        self.searchTableView.dataSource = self
        self.viewModel.delegate = self
        registerTableViewCells()
    }
    
    func showActivityIndicatory() {
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }
    
    func registerTableViewCells () {
        searchTableView.register(UINib(nibName: "BookDisplayTableViewCell", bundle: nil), forCellReuseIdentifier: "BookDisplayTableViewCell")
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource, MyCellDelegate {
    
    func favoriteItem(cell: BookDisplayTableViewCell) {
        if let bookName = cell.bookTitles.text {
            self.viewModel.favoriteBookNameAtIndexPath(bookName: bookName)
        }
        
        guard let indexPath = searchTableView.indexPath(for: cell) else { return }
        imageIndex = indexPath.row
        self.viewModel.favoriteImageLink(imageUrl: imagesArray[indexPath.row])
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfBooks() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var myCell = UITableViewCell()
        if let cell = searchTableView.dequeueReusableCell(withIdentifier: "BookDisplayTableViewCell") as? BookDisplayTableViewCell {
            
            cell.favoritebutton.tag = indexPath.row
            cell.bookTitles.text = viewModel.getBookTitle(at: indexPath.row)
            
            if let imageString = viewModel.getBookThumbnail(at: indexPath.row) {
                imagesArray.append(imageString)
                cell.bookImages.kf.setImage(with: URL(string: imageString))
            }
            
            if let authorName = viewModel.getAuthorName(at: indexPath.row) {
                cell.authorsLabel.text = "Author: " + authorName
            }
            cell.delegate = self
            myCell = cell
        }
        return myCell
    }
}

extension SearchViewController: HomeViewModelDelegate, UISearchBarDelegate {
    
    func booksUpdated() {
        DispatchQueue.main.async {
            self.searchTableView.reloadData()
            self.activityView.stopAnimating()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return }
        
        viewModel.search(text: text)
        searchBar.resignFirstResponder()
        searchBar.text = ""
        showActivityIndicatory()
    }
}


