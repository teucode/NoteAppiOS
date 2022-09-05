//
//  KameraViewController.swift
//  NoteMee
//
//  Created by Lab_PK_05 on 26/11/18.
//  Copyright © 2018 tubes. All rights reserved.
//

import UIKit

class KameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var viewkamera: UIImageView!
    
    @IBAction func kamera(_ sender: Any) {
        
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
    
    
    @IBAction func cancel(_ sender: Any) {
        self.performSegue(withIdentifier: "kamerakeluar", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
