//
//  ImageSwapViewController.swift
//  OpenCV
//
//  Created by Durgesh Trivedi on 22/02/17.
//  Copyright © 2017 durgesh. All rights reserved.
//

import UIKit

class PageViewController : UIPageViewController {

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
