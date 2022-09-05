//
//  File.swift
//  NoteMee
//
//  Created by lab_pk_01 on 24/11/18.
//  Copyright © 2018 tubes. All rights reserved.
//

import Foundation

class File: NSObject {
    var judul: String
    var isi: String
    var email: String
    
    
    init(json: [String: Any]) {
        self.judul = json["Title"] as? String ?? ""
        self.isi = json["Your File" ] as? String ?? ""
        self.email = json["Email"] as? String ?? ""
       
    }
    
    func printData(){
        print(
            " email: ", self.email,
            " judul: ", self.judul,
            " isi: ", self.isi
        )
    }
}
