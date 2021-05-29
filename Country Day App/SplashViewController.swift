//
//  LoginViewController.swift
//  Country Day App
//
//  Created by Nigel Denny on 1/19/18.
//  Copyright © 2018 Switch Tech. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SplashViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet var Spinner: UIActivityIndicatorView!
    @IBOutlet weak var GifView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GifView.loadGif(name: "loading")
        //Spinner.startAnimating()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}




