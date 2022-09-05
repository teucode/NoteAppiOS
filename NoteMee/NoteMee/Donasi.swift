//
//  Donasi.swift
//  NoteMee
//
//  Created by Lab_PK_05 on 26/11/18.
//  Copyright © 2018 tubes. All rights reserved.
//

import Foundation
class Donasi {

var Email: String
var Uang: String

init(json: [String: Any]){
    self.Email = json["email"] as? String ?? ""
    self.Uang = json["uang"] as? String ?? ""
}

func printData() {
    print(
        "email: ", self.Email,
        "uang: ", self.Uang
    )
}

}
