//
//  HomeViewController.swift
//  NoteMee
//
//  Created by Lab_PK_05 on 23/11/18.
//  Copyright © 2018 tubes. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBAction func profile(_ sender: Any) {

        self.performSegue(withIdentifier: "Profile", sender: self)
    }
    
    @IBAction func myfiles(_ sender: Any) {
        self.performSegue(withIdentifier: "Files", sender: self)
    }
    
    @IBAction func newproject(_ sender: Any) {
        self.performSegue(withIdentifier: "baru", sender: self)
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
