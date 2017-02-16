//
//  OCVCell.swift
//  OpenCV
//
//  Created by Durgesh Trivedi on 16/02/17.
//  Copyright © 2017 durgesh. All rights reserved.
//

import Foundation

import UIKit

struct Item{
    let heading: String
    let descriptions: String
}

class OCVCell: UITableViewCell {

    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var heading: String? {
        didSet{
            headingLabel.text = heading
        }
    }
    
    var descriptions: String? {
        didSet{
            descriptionLabel.text = descriptions
        }
    }
}
