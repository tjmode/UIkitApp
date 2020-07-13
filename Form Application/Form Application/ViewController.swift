//
//  ViewController.swift
//  Form Application
//
//  Created by Dhayaalan Raju on 10/07/20.
//  Copyright © 2020 Dhayaalan Raju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var firstNameText: UITextField!
    @IBOutlet var lastNameText: UITextField!
    @IBOutlet var ageText: UITextField!
    @IBOutlet var addressView: UITextView!
    @IBOutlet var phoneNumberText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        firstNameText.resignFirstResponder()
//        lastNameText.resignFirstResponder()
//        ageText.resignFirstResponder()
//        addressView.resignFirstResponder()
//        phoneNumberText.resignFirstResponder()
//    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        firstNameText.resignFirstResponder()
        lastNameText.resignFirstResponder()
        ageText.resignFirstResponder()
        addressView.resignFirstResponder()
        phoneNumberText.resignFirstResponder()
    }
}
