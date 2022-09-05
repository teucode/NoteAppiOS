//
//  NewProjectViewController.swift
//  NoteMee
//
//  Created by Lab_PK_05 on 23/11/18.
//  Copyright © 2018 tubes. All rights reserved.
//

import UIKit
import Alamofire

class NewProjectViewController: UIViewController {

    let URL_JSON = "https://officialnoteme.000webhostapp.com/insertNote.php"
        
        @IBOutlet weak var txtTitle: UITextField!
        @IBOutlet weak var txtIsi: UITextField!
    
        @IBAction func btnSave(_ sender: Any) {
            let JUDUL = self.txtTitle.text!
            let ISI = self.txtIsi.text!
           
            
            postFile(
                judul: JUDUL,
                isi: ISI)
            
            
            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }
        
    func postFile(judul: String, isi: String) {
        let parameters : Parameters = [
            "judul": judul,
            "isi": isi
        ]
        
        Alamofire.request(self.URL_JSON, method:.post, parameters: parameters).validate()
            .responseJSON { response in
                let res = response.result.value
                print(res)
                
        }
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    }

