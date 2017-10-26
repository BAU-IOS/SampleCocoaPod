//
//  ViewController.swift
//  SampleViewApp
//
//  Created by suat.karakusoglu on 26/10/2017.
//  Copyright © 2017 suat.karakusoglu. All rights reserved.
//

import UIKit
import BulletinBoard

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func actionShowBulletin()
    {
        let page = PageBulletinItem(title: "Push Notifications")
        page.descriptionText = "Receive push notifications when new photos of pets are available."
        page.actionButtonTitle = "Subscribe"
        page.alternativeButtonTitle = "Not now"
        page.interfaceFactory.tintColor = UIColor(red: 0.294, green: 0.85, blue: 0.392, alpha: 1) // green
        
        let bulletinManager = BulletinManager(rootItem: page)
        bulletinManager.prepare()
        bulletinManager.presentBulletin(above: self)
        
        page.actionHandler = { (item: PageBulletinItem) in
            debugPrint("Action button tapped")
            bulletinManager.dismissBulletin()
        }
        
        page.alternativeHandler = { (item: PageBulletinItem) in
            debugPrint("Alternative button tapped")
            bulletinManager.dismissBulletin()
        }
    }
}

