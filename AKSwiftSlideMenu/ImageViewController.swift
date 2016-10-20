//
//  ImageViewController.swift
//  iosBenchmark
//
//  Created by SMG on 17/10/2016.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit

class ImageViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var imgSelected: UIImageView!
    
    @IBOutlet weak var txtImage: UITextField!
    internal var imagePicker: UIPickerView!
    
    var images = ["Monkey", "Tabbed", "WaterFront"]
    
    var selectedRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
    }

    @IBAction func imageChanged(_ sender: UITextField) {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 100, height: 100))
        self.imagePicker = UIPickerView(frame: rect)
        self.imagePicker.backgroundColor = UIColor.white
        self.imagePicker.delegate = self;
        self.imagePicker.dataSource = self;
        txtImage.inputView = self.imagePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ImageViewController.doneImageClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        txtImage.inputAccessoryView = toolBar
    }
    
    func doneImageClick() {
        if(selectedRow != nil) {
            imgSelected.image = UIImage(named:images[selectedRow!])
            txtImage.text = images[selectedRow!]
        }
        
        txtImage.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return images[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row        
    }
}
