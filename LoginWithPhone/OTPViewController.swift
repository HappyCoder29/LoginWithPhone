//
//  OTPViewController.swift
//  LoginWithPhone
//
//  Created by Ashish Ashish on 12/2/21.
//

import UIKit
import Firebase
class OTPViewController: UIViewController {

    var verificationID : String?
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var txtOTP: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        print(" I am here")
        guard let OTP = txtOTP.text else {return}
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID!, verificationCode: OTP)
                Auth.auth().signIn(with: credential) { authResult, error in
        
                    if error != nil {
                        self.lblMessage.text = error?.localizedDescription
                        return;
                    }
        
                    self.goToLoggedInScreen()
        
                }
    }

    
    func goToLoggedInScreen(){
        performSegue(withIdentifier: "segueLoggedIn", sender: self)
    }
    

}
