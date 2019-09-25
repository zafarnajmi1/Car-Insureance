//
//  BaseImagePickerVC.swift
//  CarInsurance
//
//  Created by apple on 8/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

protocol BaseImagePickerVCDelegate: class {
    func mySelectedImage(image: UIImage)
}


class BaseImagePickerVC: UIViewController {
    
    var imagePickerDelegate: BaseImagePickerVCDelegate?
    
    struct alertPicker {
        static var title = "Title"
        static var message = "Please Select an Option".localized
        static var camera = "Camera".localized
        static var photo = "Photo Library".localized
        static var cancel = "Cancel".localized
    }
    
    
    
    @IBAction func pickImageBtnTapped(sender: UIButton) {
        
        self.alertPickerOptions()
    }
    
    
    private func alertPickerOptions() {
        
        let alert = UIAlertController(title: alertPicker.message, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: alertPicker.photo, style: .default , handler:{ (UIAlertAction)in
            let vc = UIImagePickerController()
            vc.sourceType = .photoLibrary
            vc.allowsEditing = true
            vc.delegate = self
            self.present(vc, animated: true)
        }))
        
        
        alert.addAction(UIAlertAction(title: alertPicker.camera , style: .default , handler:{ (UIAlertAction)in
            
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.allowsEditing = true
            vc.delegate = self
            self.present(vc, animated: true)
            
        }))
        
        alert.addAction(UIAlertAction(title: alertPicker.cancel , style: .cancel , handler:{ (UIAlertAction)in
            
            print("Cancel")
            
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
}


extension BaseImagePickerVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        imagePickerDelegate?.mySelectedImage(image: image)
        // print out the image size as a test
        print(image.size)
    }
    
    
}
