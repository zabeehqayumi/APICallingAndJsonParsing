//
//  HistoryViewController.swift
//  APICallingAndJsonParsing
//
//  Created by Zab on 7/4/22.
//

import UIKit
import Kingfisher

class HistoryViewController: UIViewController {
    
    private let sectionInsets = UIEdgeInsets(
        top: 50.0,
        left: 20.0,
        bottom: 50.0,
        right: 20.0)
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    lazy var favViewModel = FavoriteViewModel()
    
    private let itemsPerRow: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        favViewModel.fetchBooksImageString()
        myCollectionView.reloadData()
        myCollectionView.register(HistoryCellCollectionViewCell.self, forCellWithReuseIdentifier: "HistoryCellCollectionViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favViewModel.refreshData()
        myCollectionView.reloadData()
    }
}

extension HistoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favViewModel.favoritesImagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var myCell = UICollectionViewCell()
        if let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "HistoryCellCollectionViewCell", for: indexPath) as? HistoryCellCollectionViewCell {
            
            let imageview: UIImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 60, height: 60));
            let imageString = favViewModel.favoritesImagesArray[indexPath.row]
            imageview.kf.setImage(with: URL(string: imageString))
            cell.contentView.addSubview(imageview)
            myCell = cell
        }
        return myCell
    }
}

extension HistoryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
