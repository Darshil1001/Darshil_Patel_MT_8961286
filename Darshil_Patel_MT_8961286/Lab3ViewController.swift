//
//  ViewController.swift
//  Assignment_Lab3_UIText
//
//  Created by user238116 on 1/23/24.
//

import UIKit

class Lab3ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var textViewVal: UITextView!
    @IBOutlet var hiddenLabel: UILabel!
    
    @IBAction func addBtn(_ sender: UIButton) {
        let fName:String = firstName.text ?? ""
        let lName:String = lastName.text ?? ""
        let countryName:String = country.text ?? ""
        let ageVal:Int = Int(age.text!) ?? 0
        let fullName:String = fName+" "+lName
        
        textViewVal.text = "Full Name : \(fullName) \nCountry : \(countryName) \nAge : \(ageVal)"
    }
    @IBAction func submitBtn(_ sender: UIButton) {
        let fName:String = firstName.text ?? ""
        let lName:String = lastName.text ?? ""
        let countryName:String = country.text ?? ""
        let ageVal:Int = Int(age.text!) ?? 0
        hiddenLabel.isHidden = false
        if(!fName.isEmpty && !lName.isEmpty && !countryName.isEmpty && ageVal>0)
        {
            hiddenLabel.text = "Successfully submitted!"
        }else{
            hiddenLabel.text = "Complete the missing Info!"
        }
    }
    @IBAction func clearBtn(_ sender: UIButton) {
        firstName.text = ""
        lastName.text = ""
        country.text = ""
        age.text = ""
        textViewVal.text = ""
        hiddenLabel.text = ""
        hiddenLabel.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

