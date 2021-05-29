//
//  CycleViewController.swift
//  Country Day App
//
//  Created by Nigel Denny on 1/25/18.
//  Copyright © 2018 Switch Tech. All rights reserved.
//

import UIKit
import WebKit

class MessagesViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    var webView: WKWebView!
    var progressView: UIProgressView!
    
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.applicationNameForUserAgent = "Version/8.0.2 Safari/600.2.5"
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        progressView.progressTintColor = UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1.0)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.backgroundColor = UIColor.clear
        webView.backgroundColor = UIColor(red: 0.0196, green: 0.4, blue: 0.2902, alpha: 1.0)
        webView.isOpaque = false
        
        self.webView.load(NSURLRequest(url: URL(string: "https://fnbr.co/shop")!) as URLRequest);
        
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil);
        
        navigationController?.navigationBar.barTintColor = UIColor.purple
        let image: UIImage = UIImage(named: "Fortnite.png")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            print(self.webView.estimatedProgress);
            self.progressView.progress = Float(self.webView.estimatedProgress);        }
    }
}
