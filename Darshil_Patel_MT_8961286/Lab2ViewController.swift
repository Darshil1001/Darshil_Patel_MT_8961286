//
//  ViewController.swift
//  Assignment_Lab2_UIControl
//
//  Created by user238116 on 1/17/24.
//

import UIKit

class Lab2ViewController: UIViewController {

    var num:Int = 0
    var key:Int = 0
    @IBAction func btnIncrement(_ sender: UIButton) {
        if(key == 0)
        {
            num +=  1
            textNum.text = String(num)
        }else{
            num += 2
            textNum.text = String(num)
        }
            }
    @IBAction func btnDecrement(_ sender: UIButton) {
        if(key == 0)
        {
            num -=  1
            textNum.text = String(num)
        }else{
            num -= 2
            textNum.text = String(num)
        }    }
    @IBAction func btnReset(_ sender: UIButton) {
        textNum.text = String(0)
        num = 0
        key = 0
    }
    @IBAction func btnStep2(_ sender: UIButton) {
        key = 1
        
    }
    @IBOutlet weak var textNum: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        num = Int(textNum.text!) ?? 0
        // Do any additional setup after loading the view.
    }


}

