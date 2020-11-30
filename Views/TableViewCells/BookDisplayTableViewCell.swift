//
//  BookDisplayTableViewCell.swift
//  APICallingAndJsonParsing
//
//  Created by Zab on 11/5/20.
//

import UIKit

protocol MyCellDelegate: AnyObject {
    func favoriteItem(cell: BookDisplayTableViewCell)
}

class BookDisplayTableViewCell: UITableViewCell {

    @IBOutlet weak var bookTitles: UILabel!
    @IBOutlet weak var bookImages: UIImageView!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var favoritebutton: UIButton! {
        didSet {
            favoritebutton.setTitle("Favorite", for: .normal)
        }
    }
    
    weak var delegate: MyCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        self.delegate?.favoriteItem(cell: self)
        
        if favoritebutton.titleLabel?.text == "Favorite" {
            favoritebutton.setTitle("Favorited", for: .normal)
        } else {
            favoritebutton.setTitle("Favorite", for: .normal)
        }
    }
}
