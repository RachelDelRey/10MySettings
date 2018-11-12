//
//  ViewController.swift
//  MySettings
//
//  Created by Rachel Unger on 11/12/18.
//  Copyright © 2018 Rock Valley College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBAction func btnSave(_ sender: UIButton) {
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(self.txtFullName.text, forKey: "fullname")
        defaults.set(self.txtPhone.text, forKey: "phone")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
        let newDate = dateFormatter.string(from:datepicker.date) //pass Date here
        defaults.set(newDate, forKey: "bdate")
        print(datepicker.date.description)
        defaults.synchronize()
        clear()
        
    }
    
    func clear()
    {
        txtPhone.resignFirstResponder()
        txtFullName.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults: UserDefaults = UserDefaults.standard
        if defaults.string(forKey: "fullname") != nil{
            txtFullName.text = defaults.string(forKey: "fullname")
        }
        if defaults.string(forKey: "phone") != nil{
            txtPhone.text = defaults.string(forKey: "phone")
        }
        if defaults.string(forKey: "bdate") != nil{
            let bdate  = defaults.string(forKey: "bdate")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy" //Your date format
            let date = dateFormatter.date(from: bdate!) //according to date format your date string
            datepicker.setDate(date!, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

