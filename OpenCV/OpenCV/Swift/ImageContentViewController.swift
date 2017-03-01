//
//  ImageContentViewController.swift
//  OpenCV
//
//  Created by Durgesh Trivedi on 01/03/17.
//  Copyright © 2017 durgesh. All rights reserved.
//

import Foundation
import UIKit

class ImageContentViewController : UIViewController {
    
    
    @IBOutlet weak var imageName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var swapButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    var pagetitle: String?
    var pageIndex: Int8?
    
    override func viewDidLoad() {
        
        if let imageview =  imageView {
            imageview.image =  readImage(name: FileName.donald)
            imageName.text = self.pagetitle
        }
        
    }
    
    func  readImage(name: String) -> UIImage? {
        var image: UIImage?
        if let filepath = Bundle.main.path(forResource: name, ofType: "jpg") {
            image = UIImage.init(contentsOfFile: filepath)
        }
        return image
    }
    
}
