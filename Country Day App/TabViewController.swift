//
//  TabViewController.swift
//  Country Day App
//
//  Created by James Welsh JR on 1/24/18.
//  Copyright © 2018 Switch Tech. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {
    var pressedCount: Int = 0
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {}
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        pressedCount += 1
        if pressedCount > 1 {
            scrollToTop()
        } else {
            //do something for first press
        }
        print("Selected item")
    }
    
    // UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected view controller")
    }
    func tabBarController(_ TabViewController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let viewControllers = viewControllers else { return false }
        if viewController == viewControllers[selectedIndex] {
            if let nav = viewController as? UINavigationController {
                guard let topController = nav.viewControllers.last else { return true }
                if !topController.isScrolledToTop {
                    topController.scrollToTop()
                    return false
                } else {
                    nav.popViewController(animated: true)
                }
                return true
            }
        }
        
        return true
    }
}


extension UIViewController {
    func scrollToTop() {
        func scrollToTop(view: UIView?) {
            guard let view = view else { return }
            
            switch view {
            case let scrollView as UIScrollView:
                if scrollView.scrollsToTop == true {
                    scrollView.setContentOffset(CGPoint(x: 0.0, y: -scrollView.contentInset.top), animated: true)
                    return
                }
            default:
                break
            }
            
            for subView in view.subviews {
                scrollToTop(view: subView)
            }
        }
        
        scrollToTop(view: view)
    }
    
    var isScrolledToTop: Bool {
        if self is UITableViewController {
            return (self as! UITableViewController).tableView.contentOffset.y == 0
        }
        for subView in view.subviews {
            if let scrollView = subView as? UIScrollView {
                return (scrollView.contentOffset.y == 0)
            }
        }
        return true
    }
}
