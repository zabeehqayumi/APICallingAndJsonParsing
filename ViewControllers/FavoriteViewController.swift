//
//  FavoriteViewController.swift
//  APICallingAndJsonParsing
//
//  Created by Zab on 11/5/20.
//

import UIKit
import Kingfisher

class FavoriteViewController: UIViewController {
    
    lazy var viewModel = FavoriteViewModel()
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        viewModel.fetchingBookNames()
        viewModel.fetchBooksImageString()
        favoritesTableView.reloadData()
        registerTableViewCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.refreshData()
        favoritesTableView.reloadData()
    }
    
    func registerTableViewCells() {
        favoritesTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoritesTableViewCell")
    }
    
    @IBAction func deleteItemsTapped(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "favorites")
        UserDefaults.standard.synchronize()
        viewModel.favorites.removeAll()
        
        UserDefaults.standard.removeObject(forKey: "imageStrings")
        UserDefaults.standard.synchronize()
        viewModel.favoritesImagesArray.removeAll()
        favoritesTableView.reloadData()
    }
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var newCell = UITableViewCell()
        
        if let cell = favoritesTableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell") as? FavoritesTableViewCell {
            cell.favoriteLabel.text = viewModel.favorites[indexPath.row]
            
            let imageString = viewModel.favoritesImagesArray[indexPath.row]
            cell.favoriteImage.kf.setImage(with: URL(string: imageString))
            
            newCell = cell
        }
        return newCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.viewModel.favorites.remove(at: indexPath.row)
            self.favoritesTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
