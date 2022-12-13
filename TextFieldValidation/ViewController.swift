//
//  ViewController.swift
//  TextFieldValidation
//
//  Created by Bhumika Patel on 13/12/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPass: UITextField!
    @IBOutlet var txtMobileNo: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSave(_ sender: Any) {
        if (txtEmail.text?.isValidEmail)!{
            print("your email is valid")
            
        }else{
            print("your email is not valid")
        }
    }
    
}

extension String{
    var isPhoneNumber: Bool{
        do{
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self,options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && self.count == 10
                } else {
                    return false
                }
            }  catch {
                return false
            }
        }
        var isPasswordValid: Bool {
            let passwordTest = NSPredicate(format: "self matched %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
            return passwordTest.evaluate(with: self)
        }
        // email validation
        var isValidEmail: Bool{
            //{3} means .com for used
            let emailRegxEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3}"
            //predicate means find array- same as filter
            let emailTest = NSPredicate(format: "self matches %@", emailRegxEx)
            return emailTest.evaluate(with: self)
        }
    
}
