//
//  RegisterViewController.swift
//  NoteMee
//
//  Created by Lab_PK_05 on 23/11/18.
//  Copyright © 2018 tubes. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    
    let URL_JSON = "https://officialnoteme.000webhostapp.com/register.php"

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var email_reg: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    @IBAction func register(_ sender: Any) {
        self.performSegue(withIdentifier: "masuk", sender: self)
        
        let Username = self.username.text!
        let Email = self.email_reg.text!
        let Password  = self.pass.text!
        
        postMember(
            username: Username,
            email: Email,
            password: Password
        )
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.performSegue(withIdentifier: "CancelReg", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func postMember(username: String, email: String, password: String) {
        let parameters : Parameters = [
            "username": username,
            "email": email,
            "password": password
        ]
        
        Alamofire.request(self.URL_JSON, method:.post, parameters: parameters).validate()
            .responseJSON { response in
                let res = response.result.value
                print(res)
                
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
