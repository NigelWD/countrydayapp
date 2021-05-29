//
//  AccountViewController.swift
//  Country Day App
//
//  Created by Nigel Denny on 1/27/18.
//  Copyright © 2018 Switch Tech. All rights reserved.
//

import UIKit
import Foundation
import MessageUI
import Firebase
import GoogleSignIn

class AccountViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.white
        
        let headerLabel = UILabel(frame: CGRect(x: 15, y: 6, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
        headerLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        headerLabel.textColor = UIColor.black
        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
        headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.tableFooterView = UIView(frame: CGRect.zero)
        //tableView.sectionFooterHeight = 0.0
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .clear
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 1{
            print("pressed")
            let mailComposeViewController2 = configureMailController2() //Your error was in this line
            if MFMailComposeViewController.canSendMail() {
                self.present(mailComposeViewController2, animated: true, completion: nil)
            } else {
                showMailError()
            }
        }
        if indexPath.section == 1 && indexPath.row == 0 {
            print("pressed")
            let mailComposeViewController = configureMailController()
            if MFMailComposeViewController.canSendMail() {
                self.present(mailComposeViewController, animated: true, completion: nil)
            } else {
                showMailError()
            }
        }
        if indexPath.section == 0 && indexPath.row == 2 {
            print("pressed")
            let mailComposeViewController = configureMailController3()
            if MFMailComposeViewController.canSendMail() {
                self.present(mailComposeViewController, animated: true, completion: nil)
            } else {
                showMailError()
            }
        }
        if indexPath.section == 1 && indexPath.row == 2 {
            print("pressed")
            let mailComposeViewController = configureMailController4()
            if MFMailComposeViewController.canSendMail() {
                self.present(mailComposeViewController, animated: true, completion: nil)
            } else {
                showMailError()
            }
        }
        if indexPath.section == 1 && indexPath.row == 3 {
            print("pressed")
            let mailComposeViewController = configureMailController5()
            if MFMailComposeViewController.canSendMail() {
                self.present(mailComposeViewController, animated: true, completion: nil)
            } else {
                showMailError()
            }
        }
    }
    //if indexPath.section == 1 && indexPath.row == 1 {
    
    //}
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["SolsticeOfficialLLC@gmail.com"])
        mailComposerVC.setSubject("Suggestion: ")
        
        return mailComposerVC
    }
    func configureMailController2() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["SolsticeOfficialLLC@gmail.com"])
        mailComposerVC.setSubject("Report: ")
        
        return mailComposerVC
    }
    func configureMailController3() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["SolsticeOfficialLLC@gmail.com"])
        mailComposerVC.setSubject("Delete Account: ")
        mailComposerVC.setMessageBody("Please tell us the email you used to sign up:", isHTML: false)
        
        return mailComposerVC
    }
    func configureMailController4() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["SolsticeOfficialLLC@gmail.com"])
        mailComposerVC.setSubject("Title of Homepage post: ")
        mailComposerVC.setMessageBody("Please insert the post below:", isHTML: false)
        
        return mailComposerVC
    }
    func configureMailController5() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["SolsticeOfficialLLC@gmail.com"])
        mailComposerVC.setSubject("Title of Clubs post: ")
        mailComposerVC.setMessageBody("Please insert the post below:", isHTML: false)
        
        return mailComposerVC
    }
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device could not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith: MFMailComposeResult, error: Error?){
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}
