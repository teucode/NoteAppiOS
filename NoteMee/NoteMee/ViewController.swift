//
//  ViewController.swift
//  NoteMee
//
//  Created by Lab_PK_05 on 23/11/18.
//  Copyright © 2018 tubes. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let URL_JSON = "https://officialnoteme.000webhostapp.com/login.php"
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    var emailInput: String!
    var passInput: String!
    
    @IBAction func login(_ sender: Any) {
        //let email = self.email.text!
        //let password = self.password.text!
        
        //loginUser(email: email, password: password)
        
        let parameters : Parameters = [
            "email": email,
            "password": password
        ]
        
        Alamofire.request(URL_JSON, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    let jsonData = result as! NSDictionary
                    
                    //if there is no error
                    if(!(jsonData.value(forKey: "response") as! Bool)){
                        
                        //getting the user from response
                        let email = jsonData.value(forKey: "email") as! String
                        let pass =  jsonData.value(forKey: "password") as! String
                        
                        self.emailInput = email
                        self.passInput = pass
                        
                        print(self.emailInput)
                        
                        self.performSegue(withIdentifier: "Login", sender: self)
                        
                    }else{
                        //error message in case of invalid credential
                        let alertController = UIAlertController(title: "Tidak Dapat Login", message:
                            "Cek Kembali Email dan Password", preferredStyle: UIAlertController.Style.alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default,handler: nil))
                        
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                    }
                }
        }
    }
    
    //var user : User? = nil
    
    
    
    @IBAction func register(_ sender: Any){
        self.performSegue(withIdentifier: "Register", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    /*
    fileprivate func setUser(){
        DispatchQueue.main.async (execute:  {
                self.email.text = self.user?.Email
                self.password.text = self.user?.Password
            })
    }

    fileprivate func getJson(urlString: String){
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!){
            (data, response, err) in
            if err != nil {
                print("error", err ?? "")
            }
            else{
                print(response)
                if let useable = data {
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: useable, options: .mutableContainers) as AnyObject
                        
                        print(jsonObject)
                        
                        if let usr = jsonObject as? [String: AnyObject]{
                            self.user = User(json: usr )
                            self.setUser()
                            self.performSegue(withIdentifier: "Login", sender: self)
                        }
                        else{
                            print("nil")
                        }
                    }
                    catch{
                        print("error catch")
                    }
                }
            }
            }.resume()
    }*/
    
    func loginUser(email: String, password: String) {
        let parameters : Parameters = [
            "email": email,
            "password": password
        ]
        
        Alamofire.request(self.URL_JSON, method:.post, parameters: parameters).validate()
            .responseJSON { response in
                 /*print(response)
                let res = response.result.value
                let JSON = res as! NSDictionary
                var responseval = JSON.value(forKey: "value")! as? Int
                  self.performSegue(withIdentifier: "Login", sender: self)*/
             
        }}
    
    func getDataUser(id : Int) {
        Alamofire.request("https://freeg.thekingcorp.org/thehell/user/readOne.php?id=\(id)", method:.get).validate()
            .responseJSON { response in
                print(response)
                let res = response.result.value
                let JSON = res as! NSDictionary
                LogUser.email = JSON.value(forKey: "email") as? String
                LogUser.password = JSON.value(forKey: "password") as? String
        }
    }
    
    
    
}

