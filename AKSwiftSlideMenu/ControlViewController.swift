//
//  ControlsViewController.swift
//  iosBenchmark
//
//  Created by SMG on 17/10/2016.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit

class ControlViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var txtBirthday: UITextField!
    var datePicker: UIDatePicker!
    
    @IBOutlet weak var txtJob: UITextField!
    var jobPicker: UIPickerView!
    
    @IBOutlet weak var txtGender: UITextField!
    var genderPicker: UIPickerView!
    
    @IBOutlet weak var sldDebt: UISlider!
    @IBOutlet weak var lblDebt: UILabel!
    
    @IBOutlet weak var stpAge: UIStepper!
    @IBOutlet weak var lblAge: UILabel!
    
    var jobs = ["Avukat", "Diş Hekimi", "Doktor", "Mühendis", "Serbest"]
    var genders = ["Erkek", "Kadın"]

    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
    }
    
    @IBAction func debtValueChanged(_ sender: UISlider) {
        let value : Int = Int(sender.value)
        lblDebt.text = "\(value)"
    }
    
    @IBAction func ageValueChanged(_ sender: UIStepper) {
        let value : Int = Int(sender.value)
        lblAge.text = "\(value)"
    }
    
    
    @IBAction func birthDayDidBeginEditing(_ sender: UITextField) {
        self.pickUpDate(textField: self.txtBirthday)
    }
    
    @IBAction func jobDidBeginEditing(_ sender: UITextField) {
        self.pickupJob(textField: self.txtJob)
    }
    
    @IBAction func genderDidBeginEditing(_ sender: UITextField) {
        self.pickupGender(textField: self.txtGender)
    }
    
    func pickupJob(textField: UITextField) {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 100, height: 100))
        self.jobPicker = UIPickerView(frame: rect)
        self.jobPicker.backgroundColor = UIColor.white
        self.jobPicker.delegate = self;
        self.jobPicker.dataSource = self;
        txtJob.inputView = self.jobPicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ControlViewController.doneJobClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        txtJob.inputAccessoryView = toolBar
    }
    
    func doneJobClick() {
        txtJob.resignFirstResponder()
    }
    
    func pickupGender(textField: UITextField){
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 100, height: 100))
        self.genderPicker = UIPickerView(frame: rect)
        self.genderPicker.backgroundColor = UIColor.white
        self.genderPicker.delegate = self;
        self.genderPicker.dataSource = self;
        txtGender.inputView = self.genderPicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ControlViewController.doneGenderClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        txtGender.inputAccessoryView = toolBar
    }
    
    func doneGenderClick() {
        txtGender.resignFirstResponder()
    }
    
    func pickUpDate(textField : UITextField){
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 100, height: 150))
        self.datePicker = UIDatePicker(frame: rect)
        
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePickerMode.dateAndTime
        txtBirthday.inputView = self.datePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ControlViewController.doneBirthdayClick))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        txtBirthday.inputAccessoryView = toolBar
    }
    
    func doneBirthdayClick() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        txtBirthday.text = dateFormatter.string(from: datePicker.date)
        txtBirthday.resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(self.jobPicker != nil && pickerView == self.jobPicker) {
            return jobs.count
        }
        else {
            return genders.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(self.jobPicker != nil && pickerView == self.jobPicker) {
            return jobs[row]
        }
        else {
            return genders[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(self.jobPicker != nil && pickerView == self.jobPicker){
            txtJob.text = jobs[row]
            txtJob.resignFirstResponder()
        }
        else {
            txtGender.text = genders[row]
            txtGender.resignFirstResponder()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
