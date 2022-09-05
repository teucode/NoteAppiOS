//
//  ProfileViewController.swift
//  NoteMee
//
//  Created by Lab_PK_05 on 23/11/18.
//  Copyright © 2018 tubes. All rights reserved.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let URL_JSON = "https://officialnoteme.000webhostapp.com/editUser.php"
    
    
    @IBOutlet weak var viewkamera: UIImageView!
    
    
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var username: UITextField!
    
    
    @IBAction func change(_ sender: Any) {
        let alertController = UIAlertController(title: "", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "Dari Kamera", style: .default, handler: { (action: UIAlertAction!) in
            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                
                imagePicker.allowsEditing = false
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                self.present(imagePicker, animated: false, completion: nil)
            }
            
        }))
        
        alertController.addAction(UIAlertAction(title: "Dari Galeri", style: .default, handler: { (action: UIAlertAction!) in
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
            {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                
                imagePicker.allowsEditing = false
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                self.present(imagePicker, animated: false, completion: nil)
            }
            
        }))
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func save(_ sender: Any) {
        let Username = self.username.text!
        let Email = self.email.text!
        
        postMember(
            username: Username,
            email: Email
        )
         let alertControl = UIAlertController(title: "", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alertControl.addAction(UIAlertAction(title: "Berhasil", style: .default, handler: { (action) in
            alertControl.dismiss(animated: true, completion: nil)
        }))

        self.present(alertControl, animated: true, completion: nil)
    }
    
    @IBAction func logout(_ sender: Any) {
        self.performSegue(withIdentifier: "logout", sender: self)
    }

    @IBAction func cancel(_ sender: Any) {
        self.performSegue(withIdentifier: "cancel", sender: self)
    }
    
    func postMember(username: String, email: String) {
        let parameters : Parameters = [
            "username": username,
            "email": email
        ]
        
        Alamofire.request(self.URL_JSON, method:.post, parameters: parameters).validate()
            .responseJSON { response in
                let res = response.result.value
                print(res)
                
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            viewkamera.image = image
        } else if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            viewkamera.contentMode = .scaleToFill
            viewkamera.image = pickedImage
        } else {
            print("Error....")
        }
        
        self.dismiss(animated: false, completion: nil)
        picker.dismiss(animated: true, completion: nil)
    }
    
}
