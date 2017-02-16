//
//  OpenCVListDataSource.swift
//  OpenCV
//
//  Created by Durgesh Trivedi on 16/02/17.
//  Copyright © 2017 durgesh. All rights reserved.
//

import Foundation

import UIKit
class OpenCVListDataSource: NSObject {
    let items: [Item]
    
    init (items:[Item]) {
      self.items = items
    }
}


extension OpenCVListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String("OCVCell")) as! OCVCell
        let item = items[indexPath.row]
        cell.heading = item.heading
         cell.descriptions = item.descriptions
        return cell
    }

}
