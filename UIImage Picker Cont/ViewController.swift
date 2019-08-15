//
//  ViewController.swift
//  UIImage Picker Cont
//
//  Created by Mirko Cukich on 8/12/19.
//  Copyright © 2019 Digital Mirko. All rights reserved.
//
//  Swift UIImagePickerController Demo - Demo 9 of 30

import UIKit

class ViewController: UIViewController {
    
    // Referencing Bottom ImageView
    @IBOutlet weak var imageView: UIImageView!
    
    // image picker using a lazy property, which won't be initialized
    // until called for the first time
    lazy var imagePicker: UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.delegate = self
        ip.allowsEditing = false
        ip.sourceType = .photoLibrary
        return ip
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // enabling navigation bar camera icon to get photos to put into imageView
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.camera, target: self, action: #selector(cameraBtn(_:)))
    }
    
    // navigation bar camera
    @IBAction func cameraBtn(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
}
    // selecting the image for the imageview or canceling your choice
    extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        func imagePickerController(_ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            // checking if image picked
            guard let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
                else {
                    return
            }
            // if user has picked something
            self.imageView.image = pickedImage
            // dismiss if image picked
            dismissViewController()
        }
        // cancel selection option
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismissViewController()
        }
        
        // dismiss view function
        func dismissViewController () {
            dismiss(animated: true, completion: nil)
        }
    }


