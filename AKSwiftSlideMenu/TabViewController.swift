//
//  TabViewController.swift
//  iosBenchmark
//
//  Created by SMG on 17/10/2016.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit

class TabViewController: BaseViewController, UITabBarDelegate {

    @IBOutlet weak var tabControl: UITabBar!
    @IBOutlet weak var vwRect: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        
        self.tabControl.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.tag == 0) {
            self.lblTitle.text = "Red"
            self.vwRect.backgroundColor = UIColor.red
        }
        else if(item.tag == 1) {
            self.lblTitle.text = "Blue"
            self.vwRect.backgroundColor = UIColor.blue
        }
        else {
            self.lblTitle.text = "Black"
            self.vwRect.backgroundColor = UIColor.black
        }
    }
}
