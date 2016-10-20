//
//  PopupViewController.swift
//  iosBenchmark
//
//  Created by SMG on 17/10/2016.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit

class PopupViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "Alert", message: "You have been alerted", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showConfirm(_ sender: UIButton) {
        let alert = UIAlertController(title: "Question?", message: "Would you like to play a game", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showActionSheet(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "Choose Option", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "Twitter", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Facebook", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Email", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
