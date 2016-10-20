//
//  CarouselViewController.swift
//  iosBenchmark
//
//  Created by SMG on 17/10/2016.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit

class CarouselViewController: BaseViewController {

    // create swipe gesture
    let swipeGestureLeft = UISwipeGestureRecognizer()
    let swipeGestureRight = UISwipeGestureRecognizer()
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var vwRect: UIView!
    @IBOutlet weak var pcStepper: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        
        // set gesture direction
        self.swipeGestureLeft.direction = UISwipeGestureRecognizerDirection.left
        self.swipeGestureRight.direction = UISwipeGestureRecognizerDirection.right
        
        // add gesture target
        self.swipeGestureLeft.addTarget(self, action: #selector(CarouselViewController.handleSwipeLeft(_:)))
        self.swipeGestureRight.addTarget(self, action: #selector(CarouselViewController.handleSwipeRight(_:)))
        
        // add gesture in to view
        self.view.addGestureRecognizer(self.swipeGestureLeft)
        self.view.addGestureRecognizer(self.swipeGestureRight)
        
        // set current page number label.
        self.setCurrentPageLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // increase page number on swift left
    func handleSwipeLeft(_ gesture: UISwipeGestureRecognizer){
        if self.pcStepper.currentPage < 3 {
            self.pcStepper.currentPage += 1
            self.setCurrentPageLabel()
        }
    }
    
    // reduce page number on swift right
    func handleSwipeRight(_ gesture: UISwipeGestureRecognizer){
        
        if self.pcStepper.currentPage != 0 {
            self.pcStepper.currentPage -= 1
            self.setCurrentPageLabel()
        }
        
        
    }
    
    // set current page number label
    fileprivate func setCurrentPageLabel(){
        if(self.pcStepper.currentPage == 0) {
            self.lblTitle.text = "Red"
            self.vwRect.backgroundColor = UIColor.red
        }
        else if(self.pcStepper.currentPage == 1) {
            self.lblTitle.text = "Blue"
            self.vwRect.backgroundColor = UIColor.blue
        }
        else {
            self.lblTitle.text = "Black"
            self.vwRect.backgroundColor = UIColor.black
        }
    }
}
