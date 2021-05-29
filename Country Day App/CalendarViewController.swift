//
//  CalendarViewController.swift
//  Country Day App
//
//  Created by Nigel Denny on 11/8/18.
//  Copyright © 2018 Solstice. All rights reserved.
//

import UIKit
import WebKit

class CalendarViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    var webView: WKWebView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.setProgress(0.1, animated: true)
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.applicationNameForUserAgent = "Version/8.0.2 Safari/600.2.5"
        
        let customFrame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: 0.0, height: self.containerView.frame.size.height))
        
        webView = WKWebView(frame: customFrame, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.containerView.addSubview(webView)
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraint(NSLayoutConstraint(item: webView, attribute: .trailing, relatedBy: .equal, toItem: self.containerView, attribute: .trailing, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: webView, attribute: .leading, relatedBy: .equal, toItem: self.containerView, attribute: .leading, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: self.containerView, attribute: .top, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem: self.containerView, attribute: .bottom, multiplier: 1, constant: 0))
        
        
        
        progressView.sizeToFit()
        progressView.progressTintColor = UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1.0)
        
        webView.backgroundColor = UIColor.clear
        webView.backgroundColor = UIColor(red: 0.0196, green: 0.4, blue: 0.2902, alpha: 1.0)
        webView.isOpaque = false
        
        webView.load(URLRequest(url: URL(string: "https://jwelsh19.wixsite.com/website-1")!))
        
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        //create a new button
        let button = UIButton.init(type: .custom)
        //set image for button
        button.setImage(UIImage(named: "LogoMin"), for: UIControlState.normal)
        //add function for button
        button.addTarget(self, action: #selector(SportsViewController.acButtonPressed), for: UIControlEvents.touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        button.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadWebView(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.white
        webView.scrollView.addSubview(refreshControl)
    }
    
    @objc func reloadWebView(_ sender: UIRefreshControl) {
        webView.reload()
        sender.endRefreshing()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            print(self.webView.estimatedProgress);
            self.progressView.progress = Float(self.webView.estimatedProgress);        }
    }
    
    @IBAction func home(_ sender: UIButton) {
        let myURL = URL(string: "https://jwelsh19.wixsite.com/website-1")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    @IBAction func refresh(_ sender: UIButton) {
        
        webView.reload()
        
    }
    
    //This method will call when you press button.
    @objc func acButtonPressed() {
        
        print("button is pressed")
        self.performSegue(withIdentifier: "Account", sender: self)
    }
}
