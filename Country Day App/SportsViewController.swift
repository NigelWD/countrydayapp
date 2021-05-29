//
//  SportsViewController.swift
//  Country Day App
//
//  Created by James Welsh JR on 1/24/18.
//  Copyright © 2018 Switch Tech. All rights reserved.
//

import UIKit
import TwitterKit

class SportsViewController: TWTRTimelineViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.view.backgroundColor = .clear
            
            let client = TWTRAPIClient()
            self.dataSource = TWTRUserTimelineDataSource(screenName: "ccdsbucs", apiClient: client)

            // Show Tweet actions
            self.showTweetActions = false
            
            TWTRTweetView.appearance().primaryTextColor = .white
            TWTRTweetView.appearance().backgroundColor = UIColor(red: (1/255.0), green: (102/255.0), blue: (74/255.0), alpha: 1.0)
            
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
            }
            
            //This method will call when you press button.
            @objc func acButtonPressed() {
                
                print("button is pressed")
                self.performSegue(withIdentifier: "Account", sender: self)
            }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
    }


