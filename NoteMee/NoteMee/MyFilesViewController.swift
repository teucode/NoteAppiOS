//
//  MyFilesViewController.swift
//  NoteMee
//
//  Created by Lab_PK_05 on 23/11/18.
//  Copyright © 2018 tubes. All rights reserved.
//

import UIKit

class MyFilesViewController: UIViewController {

    @IBOutlet weak var txtSearch: UITextField!
    
    @IBOutlet weak var txtJudul: UITextField!
    @IBOutlet weak var txtIsi: UITextField!
    
    
    let URL_JSON = "https://officialnoteme.000webhostapp.com/register.php"
    
    var file: File? = nil
    
    @IBAction func btnSearch(_ sender: Any) {
        getJson(urlString: URL_JSON + txtSearch.text!)
    }
    
    fileprivate func setFile(){
        DispatchQueue.main.async(execute: {
            self.txtJudul.text = self.file?.judul
            self.txtIsi.text = self.file?.isi
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
                if let useable = data {
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: useable, options: .mutableContainers) as AnyObject
                        
                        print(jsonObject)
                        
                        if let myFile = jsonObject as? [String: AnyObject]{
                            self.file = File(json: myFile as! [String: AnyObject])
                            self.file?.printData()
                            self.setFile()
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
