//
//  About me.swift
//  PortfolioApp
//
//  Created by  on 11/25/19.
//  Copyright © 2019 JordansEpicApps. All rights reserved.
//

import UIKit
import MessageUI

class aboutMe: UIViewController, MFMailComposeViewControllerDelegate
{

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func backToPort(_ sender: UIButton)
    {
    
        self.dismiss(animated: true, completion: nil)
            
    }

    @IBAction func callMeButton(_ sender: UIButton)
    {
        let url:NSURL = URL(string: "TEL://6109455765")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func emailButton(_ sender: UIButton)
    {
        if MFMailComposeViewController.canSendMail() {
        let mail = MFMailComposeViewController()
       mail.mailComposeDelegate = self; mail.setToRecipients(["jmazer27@gmail.com"])
        mail.setMessageBody("", isHTML: true)
        present(mail, animated: true)
        } else {
        print("Cannot send email")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

}

