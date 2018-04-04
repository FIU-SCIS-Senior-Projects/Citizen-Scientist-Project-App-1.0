//
//  iNaturalistVimeoTutorialsPageViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/30/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

protocol iNaturalistVimeoTutorialsPageVCDelegate: class {
    func setupPageController(numberOfPages: Int)
    func turnPageController(to index: Int)
}

class iNaturalistVimeoTutorialsPageViewController: UIPageViewController {

    var vimeoImages: [UIImage]?
    var iNaturalistVideoTitles: [String]?
    
    weak var pageViewControllerDelegate: iNaturalistVimeoTutorialsPageVCDelegate?
    
    
    var imageData: [UIImage] = [
        UIImage(named: "vimeo-1")!,
        UIImage(named: "vimeo-2")!,
        UIImage(named: "vimeo-3")!,
    ]
    
    var vimeoButtonLinks: [URL] = [
        URL(string: "https://vimeo.com/162581545")!,
        URL(string: "https://vimeo.com/167431843")!,
        URL(string: "https://vimeo.com/167341998")!,
    ]
    
    var iNaturalistVideoTitlesData: [String] = [
        "MAKING AN OBSERVATION ON A MOBILE DEVICE",
        "ADDING AN OBSERVATION VIA THE WEB",
        "HOW TO TAKE IDENTIFIABLE PHOTOS",
    ]
    
    lazy var controllers: [UIViewController] = {
        let storyboard = UIStoryboard(name: Storyboard.miniChallenge, bundle: nil)
        var controllers = [UIViewController]()
        
        if let images = self.vimeoImages {
            for image in images {
                let iNaturalistVimeoTutorialVC = storyboard.instantiateViewController(withIdentifier: Storyboard.iNaturalistVimeoTutorialViewController)
                controllers.append(iNaturalistVimeoTutorialVC)
            }
        }
        
        self.pageViewControllerDelegate?.setupPageController(numberOfPages: controllers.count)
        
        return controllers
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vimeoImages = imageData
        iNaturalistVideoTitles = iNaturalistVideoTitlesData
        
        automaticallyAdjustsScrollViewInsets = false
        dataSource = self
        delegate = self
        
        self.turnToPage(index: 0)
    }
    
    func turnToPage(index: Int){
        let controller = controllers[index]
        var direction = UIPageViewControllerNavigationDirection.forward
        
        if let currentVC = viewControllers?.first{
            let currentIndex = controllers.index(of: currentVC)!
            if currentIndex > index {
                direction = .reverse
            }
        }
        
        self.configureDisplaying(viewController: controller)
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
    }
    
    func configureDisplaying(viewController: UIViewController){
        for (index, vc) in controllers.enumerated(){
            if viewController === vc {
                if let iNaturalistVimeoTutorialVC = viewController as? iNaturalistVimeoTutorialViewController{
                    iNaturalistVimeoTutorialVC.image = self.vimeoImages?[index]
                    iNaturalistVimeoTutorialVC.text = self.iNaturalistVideoTitles?[index]
                    iNaturalistVimeoTutorialVC.link = self.vimeoButtonLinks[index]
                    self.pageViewControllerDelegate?.turnPageController(to: index)
                }
            }
        }
    }

}

// MARK: - UIPageViewControllerDataSource

extension iNaturalistVimeoTutorialsPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.index(of: viewController){
            if index > 0 { // if it is not the firt controller
                return controllers[index - 1] // previous controller
            }
        }
        return controllers.last // wraps around to last view controller
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.index(of: viewController){
            if index < controllers.count - 1 { // if it is not the last controller
                return controllers[index + 1] // next controller
            }
        }
        
        return controllers.first // wraps around to last view controller
    }
    
}

// MARK: - UIPageViewControllerDelegate

extension iNaturalistVimeoTutorialsPageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.configureDisplaying(viewController: pendingViewControllers.first as! iNaturalistVimeoTutorialViewController)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed{
            self.configureDisplaying(viewController: previousViewControllers.first as! iNaturalistVimeoTutorialViewController)
        }
    }
}
