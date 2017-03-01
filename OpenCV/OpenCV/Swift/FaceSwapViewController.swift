//
//  FaceSwapViewController.swift
//  OpenCV
//
//  Created by Durgesh Trivedi on 22/02/17.
//  Copyright © 2017 durgesh. All rights reserved.
//

import UIKit

enum FileName {
    
    static let donald = "donald_trump"
    static let hillary = "hillary_clinton"
    static let ted = "ted_cruz"
    static let donald_txt = "donald_trump.jpg"
    static let hillary_txt = "hillary_clinton.jpg"
    static let ted_txt = "ted_cruz.jpg"
    
}

class FaceSwapViewController : UIViewController, UIPageViewControllerDataSource {
    
    var pageViewController: PageViewController?
    var pageImages: [UIImage]?
    var pageTitles: [String]?
    var imageFiletexts: [String]?
    
    override func viewDidLoad() {
        
        pageImages = [readImage(name: FileName.donald)!, readImage(name: FileName.hillary)!,readImage(name: FileName.ted)!]
        pageTitles = [FileName.donald, FileName.hillary, FileName.ted]
        imageFiletexts = [Bundle.main.path(forResource: FileName.donald_txt, ofType: "txt")!, Bundle.main.path(forResource: FileName.hillary_txt, ofType: "txt")!, Bundle.main.path(forResource: FileName.ted_txt, ofType: "txt")!]
        
        // Create page view controller
        
        pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? PageViewController
        pageViewController?.dataSource = self
        
        let vc = self.viewControllerAtIndex(index: 0)
        let viewControllers:[ImageContentViewController] = [vc!]
        
        pageViewController?.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        
        
        let rect = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 30) // CGFloat, Double, Int
        //        // Change the size of page view controller
        self.pageViewController?.view.frame = rect
        self.addChildViewController(pageViewController!)
        self.view.addSubview((pageViewController?.view)!)
        self.pageViewController?.didMove(toParentViewController: self)
        
        
        
    }
    
    func  readImage(name: String) -> UIImage? {
        //return  UIImage.init(named: name)
        
        var image: UIImage?
        if let filepath = Bundle.main.path(forResource: name, ofType: "jpg") {
           image = UIImage.init(contentsOfFile: filepath)
        }
        return image
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
         var  index = (viewController as? ImageContentViewController)?.pageIndex ?? 0
          if index == 0 {
            return nil
         }
         index -= 1
        
        return self.viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func viewControllerAtIndex(index: Int8) -> ImageContentViewController? {
        
        let newIndex = Int(index)
        if (self.pageImages?.count)! == 0 || newIndex >= (self.pageImages?.count)!  {
            return nil;
        }
        
        let storyboard = UIStoryboard(name: "FaceSwap", bundle: nil)
        let imageSwapViewController = storyboard.instantiateViewController(withIdentifier: "ImageContentViewController") as?  (ImageContentViewController)
        
        imageSwapViewController?.imageView?.image = self.pageImages?[newIndex]
        imageSwapViewController?.pagetitle = self.pageTitles?[newIndex]
        imageSwapViewController?.pageIndex = index;
        
        return imageSwapViewController;
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return  self.pageTitles?.count ?? 0
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    
}
