//
//  ViewController.swift
//  Darshil_Patel_MT_8961286
//
//  Created by user238116 on 2/27/24.
//

import UIKit

class ViewController: UIViewController {

    //Created Textfields and Labels for City Info and Error Message
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var cityImg: UIImageView!
    @IBOutlet weak var errorMessage: UILabel!
    
    //Created Textfields and labels for Quadratic Problem
    @IBOutlet weak var inputA: UITextField!
    @IBOutlet weak var inputB: UITextField!
    @IBOutlet weak var inputC: UITextField!
    @IBOutlet weak var quadraticError: UILabel!
    @IBOutlet weak var outputValueX: UILabel!
    
    //Created dictionary for cityname as key and cityimage as value
    let cityDic = ["calgary":"Calgary","halifax":"Halifax","montreal":"Montreal","toronto":"Toronto","vancouver":"Vancouver","winnipeg":"Winnipeg"]
        
    override func viewDidLoad() {
            super.viewDidLoad()
        
            //Created functionality of hiding keyboard when tapped
            let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
    }
    
    //Function called when tapped for dismiss
    @objc func dismissKeyboard() {
            view.endEditing(true)
    }
    
    //Created function to find city which exceute when clicked find city button
    @IBAction func findmyCity(_ sender: UIButton) {
        //Initialized errormessage hidden status to be true
        errorMessage.isHidden = true
        let givenName = cityName.text?.lowercased()
        //Checked wheather entered name is empty or not
        if(!givenName!.isEmpty){
            //Checked for keys in given name to find right image
            if(cityDic.keys.contains(givenName!)){
                cityImg.image = UIImage(named: (cityDic[givenName!]!))
                cityName.text = ""
            }else{
                errorMessage.isHidden = false
                errorMessage.textColor = .red
                errorMessage.text = "Entered city is not found"
                cityName.text = ""
            }
        }else{
            errorMessage.isHidden = false
            errorMessage.textColor = .red
            errorMessage.text = "Please enter city name"
            cityName.text = ""
        }
    }

    //Created calulateX function to calculate value of x
    @IBAction func calculateX(_ sender: UIButton) {
        //Initialized prompt message to nil
        navigationItem.prompt = nil
        quadraticError.isHidden = true
        outputValueX.isHidden = true
        //Type casted user value of A,B and C to Double for more validation
        let inputADouble: Double? = Double(inputA.text!)
        let inputBDouble: Double? = Double(inputB.text!)
        let inputCDouble: Double? = Double(inputC.text!)
        //Checked whether inputed values A,B and C are empty or not
        if(!inputA.text!.isEmpty && !inputB.text!.isEmpty && !inputC.text!.isEmpty){
            //Checked if Value A is 0 then it shows invalid message
            if(inputADouble==0){
                quadraticError.isHidden = false
                quadraticError.textColor = .red
                quadraticError.lineBreakMode = .byWordWrapping
                quadraticError.numberOfLines = 0
                quadraticError.preferredMaxLayoutWidth = 250
                quadraticError.text = "Input Value A cannot be 0 \n"
            }else{
                //Checked Values are empty if true, it will show invalid message
                if(inputADouble != nil){
                    if(inputBDouble != nil){
                        if(inputCDouble != nil){
                            //Called quadratic formula function for calculating value of x and stored it in roots variable
                            let roots = quadraticFormula(a: inputADouble!, b: inputBDouble!, c: inputCDouble!)
                            //Displayed error when discriminant is less than zero are nil else shows correct value of x
                            if(roots==nil){
                                quadraticError.isHidden = false
                                quadraticError.textColor = .red
                                quadraticError.lineBreakMode = .byWordWrapping
                                quadraticError.numberOfLines = 0
                                quadraticError.preferredMaxLayoutWidth = 250
                                quadraticError.text = "There are no results since the discriminant is less than zero"
                            }else if(roots!.0 != roots!.1){
                                outputValueX.isHidden = false
                                outputValueX.textColor = .blue
                                outputValueX.lineBreakMode = .byWordWrapping
                                outputValueX.numberOfLines = 0
                                outputValueX.preferredMaxLayoutWidth = 250
                                outputValueX.text = "There are two values for X - Root 1: \(round(roots!.0 * 100)/100) && Root 2: \(round(roots!.1 * 100)/100)"
                            }else{
                                outputValueX.isHidden = false
                                outputValueX.textColor = .blue
                                outputValueX.lineBreakMode = .byWordWrapping
                                outputValueX.numberOfLines = 0
                                outputValueX.preferredMaxLayoutWidth = 250
                                outputValueX.text = "There is only one value for X - Root: \(round(roots!.0 * 100)/100)"
                            }
                        }else{
                            quadraticError.isHidden = false
                            quadraticError.textColor = .red
                            quadraticError.lineBreakMode = .byWordWrapping
                            quadraticError.numberOfLines = 0
                            quadraticError.preferredMaxLayoutWidth = 250
                            quadraticError.text = "Input Value C is invalid \n"
                        }
                    }else{
                        quadraticError.isHidden = false
                        quadraticError.textColor = .red
                        quadraticError.lineBreakMode = .byWordWrapping
                        quadraticError.numberOfLines = 0
                        quadraticError.preferredMaxLayoutWidth = 250
                        quadraticError.text = "Input Value B is invalid \n"
                    }
                }else{
                    quadraticError.isHidden = false
                    quadraticError.textColor = .red
                    quadraticError.lineBreakMode = .byWordWrapping
                    quadraticError.numberOfLines = 0
                    quadraticError.preferredMaxLayoutWidth = 250
                    quadraticError.text = "Input Value A is invalid \n"
                }
            }
            
        }else{
            quadraticError.isHidden = false
            quadraticError.textColor = .red
            quadraticError.lineBreakMode = .byWordWrapping
            quadraticError.numberOfLines = 0
            quadraticError.preferredMaxLayoutWidth = 250
            quadraticError.text = "Enter a value for A, B and C to find X"
        }
        
    }
    
    //Created clear value function to clear the values user inputed and prompt message in the navigation
    @IBAction func clearValues(_ sender: Any) {
        inputA.text = ""
        inputB.text = ""
        inputC.text = ""
        navigationItem.prompt = "Enter a value for A, B and C to find X"
        quadraticError.isHidden = true
        outputValueX.isHidden = true
    }
    
    //This function contains the quadratic equation which return double values
    func quadraticFormula(a: Double, b: Double, c: Double) -> (Double, Double)? {
        let discriminant = b * b - 4 * a * c
        //Checked for discriminant value if less than 0 it will return and shows error to user
        guard discriminant >= 0 else {
            return nil }
        
        //Squareroot the discriminant
        let sqrtDiscriminant = sqrt(discriminant)
        let denominator = 2 * a
        
        //Calculted the roots x1 and x2
        let x1 = (-b + sqrtDiscriminant) / denominator
        let x2 = (-b - sqrtDiscriminant) / denominator
        
        return (x1, x2)
    }

}


