//
//  User.swift
//  NoteMee
//
//  Created by Lab_PK_05 on 23/11/18.
//  Copyright © 2018 tubes. All rights reserved.
//

import Foundation

class User: NSObject {
    var Username: String
    var Email: String
    var Password: String
    
    init(json: [String: Any]){
        self.Username = json["username"] as? String ?? ""
        self.Email = json["email"] as? String ?? ""
        self.Password = json["password"] as? String ?? ""
    }
    
    func printData() {
        print(
            "username: ", self.Username,
            "email: ", self.Email,
            "password: ", self.Password
        )
    }
}
