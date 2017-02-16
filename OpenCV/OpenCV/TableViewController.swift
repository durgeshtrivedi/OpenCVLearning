//
//  ViewController.swift
//  OpenCV
//
//  Created by Durgesh Trivedi on 14/02/17.
//  Copyright © 2017 durgesh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
   // @IBOutlet weak var tableView: UITableView!
    
    let dataSource: OpenCVListDataSource
    
    required init?(coder aDecoder: NSCoder) {
        let items = [
            Item(heading: "BlobDetector", descriptions: "This is BlobDetector "),
            Item(heading: "ColorMap", descriptions: "This is ColorMap "),
            Item(heading: "FaceMorph", descriptions: "This is faceMorph"),
            Item(heading: "FaceSwap", descriptions: "This is FaceSwap"),
        ]
        self.dataSource = OpenCVListDataSource(items: items)
        super.init(coder: aDecoder)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension TableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}
