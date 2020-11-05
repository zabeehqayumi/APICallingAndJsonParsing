//
//  FavoriteViewController.swift
//  APICallingAndJsonParsing
//
//  Created by Zab on 11/5/20.
//

import UIKit

class FavoriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lbl = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        lbl.text = "dummy text 2"
        self.view.addSubview(lbl)
    }
}
