//
//  BookDisplayTableViewCell.swift
//  APICallingAndJsonParsing
//
//  Created by Zab on 11/5/20.
//

import UIKit

class BookDisplayTableViewCell: UITableViewCell {

    @IBOutlet weak var bookTitles: UILabel! {
        didSet {
            bookTitles.text = "My Book"
        }
    }
    
    @IBOutlet weak var bookImages: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
