//
//  HistoryViewController.swift
//  APICallingAndJsonParsing
//
//  Created by Zab on 7/4/22.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    lazy var favViewModel = FavoriteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        // Do any additional setup after loading the view.
    }
}

extension HistoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    
}
