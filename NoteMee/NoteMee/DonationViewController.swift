//
//  DonationViewController.swift
//  NoteMee
//
//  Created by Lab_PK_05 on 26/11/18.
//  Copyright © 2018 tubes. All rights reserved.
//

import UIKit
import Alamofire

class DonationViewController: UIViewController {

    let URL_JSON = "https://officialnoteme.000webhostapp.com/donasi.php"
    
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var uang: UITextField!
    
    
    @IBAction func donasi(_ sender: Any) {
        self.performSegue(withIdentifier: "rumah", sender: self)
        
        let Email = self.email.text!
        let Uang  = self.uang.text!
        
        postDonasi(
            email: Email,
            uang: Uang
        )    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func postDonasi(email: String, uang: String) {
        let parameters : Parameters = [
            "email": email,
            "uang": uang
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
