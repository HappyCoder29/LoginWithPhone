//
//  ViewController.swift
//  LoginWithPhone
//
//  Created by Ashish Ashish on 12/2/21.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    var verifyID : String?
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var txtPhone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendOTPAction(_ sender: Any) {
        
        guard let phoneNumber = txtPhone.text else {return}
        
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            
            if error != nil {
                self.lblMessage.text = error?.localizedDescription
                print(error?.localizedDescription)
                return
            }
            self.verifyID = verificationID
            
            self.performSegue(withIdentifier: "segueOTP", sender: self)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueOTP"{
            let OTPViewController = segue.destination as! OTPViewController
            OTPViewController.verificationID = verifyID
        }
    }
    
}

