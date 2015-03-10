//
//  PhoneNumberControler.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 06/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class PhoneNumberControler: UIViewController, UITextFieldDelegate {
    let userService = UserService()
    var userName : String = ""
    var email : String = ""
    var password : String = ""
    var confirmPassword : String = ""

    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBAction func finishUserAction(sender: AnyObject) {
        let phoneNumber = phoneNumberTextField.text
        
        if userService.createUser(userName, email: email, phoneNumber: phoneNumber, password: password, confirmPassword: confirmPassword) {
            let clubHomeController = ClubHomeController(nibName: "clubHomeController", bundle: nil)
            navigationController?.pushViewController(clubHomeController, animated: true)
        }
    }
    
    override func viewDidLoad() {
        navigationController?.navigationBarHidden = true
        super.viewDidLoad()

        self.phoneNumberTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        navigationController?.navigationBarHidden = true
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

}