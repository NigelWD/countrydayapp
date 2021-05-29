//
//  InfoTableView.swift
//  Country Day App
//
//  Created by James Welsh JR on 2/12/18.
//  Copyright © 2018 Solstice. All rights reserved.
//

import UIKit

class InfoTableView: UITableView {
    
    override func tableView(_ tableView: UITableView, viewDevelopers section: Int) -> UIView? {
        let sectionTitle: String? = self.tableView(tableView, viewDevelopers: section)
        if sectionTitle == nil {
            return nil
        }
        // Create label with section title
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 6, width: 300, height: 30)
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor(hue: 136.0 / 360.0, saturation:     // Slightly bluish green
            1.0, brightness: 0.60, alpha: 1.0)
        label.shadowColor = UIColor.white
        label.shadowOffset = CGSize(width: 0.0, height: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = sectionTitle
        
        
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    

    }
}
