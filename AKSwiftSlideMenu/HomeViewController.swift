//
//  HomeViewController.swift
//  iosBenchmark
//
//  Created by SMG on 17/10/2016.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var surname: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
    }

    @IBAction func showName(_ sender: UIButton) {
        var fullname : String = ""
        
        if let txtName = name.text {
            fullname += txtName
        }
        
        if let txtSurname = surname.text {
            fullname += (" " + txtSurname)
        }
    
        let alert = UIAlertController(title: "HoşGeldin", message: fullname, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
