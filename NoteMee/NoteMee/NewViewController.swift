//
//  NewViewController.swift
//  NoteMee
//
//  Created by Lab_PK_05 on 26/11/18.
//  Copyright © 2018 tubes. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    @IBAction func new(_ sender: Any) {
        self.performSegue(withIdentifier: "newfile", sender: self)
    }
    
    @IBAction func scan(_ sender: Any) {
        self.performSegue(withIdentifier: "scan", sender: self)
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        self.performSegue(withIdentifier: "rumahbalik", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
