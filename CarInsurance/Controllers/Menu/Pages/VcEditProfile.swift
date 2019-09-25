//
//  VcEditProfile.swift
//  CarInsurance
//
//  Created by Apple on 7/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  SDWebImage
import  DLRadioButton
import  GooglePlaces
import  GooglePlacePicker
import  LocationPicker
import SKActivityIndicatorView
class VcEditProfile: UIViewController{
    @IBOutlet weak var btnsave: UIButton!
    var gender = ""
    var userID = ""
    var my_lat : Double = 0.0
    var  my_long : Double = 0.0
    var selectedImagePath: String?
    var cemeraimg = UIImagePickerController()
    var galleryimage = UIImagePickerController()
    
    
    var userProfile: getProfileData?
    
    @IBOutlet weak var btnfemale: DLRadioButton!
    @IBOutlet weak var btnmale: DLRadioButton!
    @IBOutlet weak var lblselectGender: UILabel!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var addressUiview: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var txtphonenumber: UITextField!
    @IBOutlet weak var phoneNumberUiview: UIView!
    @IBOutlet weak var lblphonenumber: UILabel!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var emaiUiview: UIView!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var txtlastName: UITextField!
    @IBOutlet weak var lastUiview: UIView!
    @IBOutlet weak var lbllastName: UILabel!
    @IBOutlet weak var txtfirstName: UITextField!
    @IBOutlet weak var firstNameUiview: UIView!
    @IBOutlet weak var lblFirdtName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    var updatedImage: UIImage?
    var mylocation = [Int]()
     var location: Location?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.txtAddress?.delegate = self
        //self.requestToFetchUserProfile()
        updateProfileUI()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      self.title = "Edit Profile".localized
        self.setNavigationBar()
        
        self.addBackButton()
        
        self.setupProfileView()
        self.setLoaclization()
    }

    
    func setLoaclization(){
        
        let tfs = [txtemail,txtlastName, txtfirstName,txtphonenumber,txtAddress] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
        
        lblFirdtName.text = "First Name".localized
        lbllastName.text = "Last Name".localized
        lblEmail.text = "Email".localized
        lblphonenumber.text = "Phone No".localized
        lblAddress.text = "Address".localized
        lblselectGender.text = "Select Gender".localized
        btnmale.setTitle("Male".localized, for: .normal)
        btnfemale.setTitle("Female".localized, for: .normal)
        btnsave.setTitle("Save".localized, for: .normal)
    }
    
    func setupProfileView(){
        
        self.addressUiview.setcornerUiview(Corner: 10)
        self.emaiUiview.setcornerUiview(Corner: 10)
        self.firstNameUiview.setcornerUiview(Corner: 10)
        self.lastUiview.setcornerUiview(Corner: 10)
        self.phoneNumberUiview.setcornerUiview(Corner: 10)
        self.userImage.setRoundimage()
        self.btnsave.setcornerButton(Corner: 10)

    }
    
    
    func resetUserImage()  {
        guard let user = userProfile else {
            return alertMessage(message: "No record found", completionHandler: nil)
        }
        let path = user.image?.resizeImage(width: 200, height: 200)
        self.userImage.setPath(string: path, "UserImage")
        
    }
    
    //MARK:- GetUSerProfile
    fileprivate func updateProfileUI() {
        guard let user = AppUserDefault.shared.userData else {
            return alertMessage(message: "No record found", completionHandler: nil)
        }
        let path = user.image?.resizeImage(width: 200, height: 200)
        self.userImage.setPath(string: path, "UserImage")
        
        //                let imgrul = NSURL( string:  (SuccessResponse.data?.image)!)
        //                self.profileimage.af_setImage(withURL: imgrul! as URL, placeholderImage: UIImage(named : "Logo2"), filter: nil, imageTransition:.curlDown(0.0), runImageTransitionIfCached: true, completion: nil)
        self.txtphonenumber.text = user.phone
        self.txtemail.text = user.email
        self.txtAddress.text = user.address
        self.txtfirstName.text = user.firstName
        self.txtlastName.text =  user.lastName
        self.userID  =  user._id!
        self.mylocation.removeAll()
        
        
        
        self.my_lat = (user.location?[0]) ?? 0
        self.my_long = (user.location?[1]) ?? 0
        
        print(self.my_long)
        print(self.my_lat)
        if(user.gender == "male"){
            self.btnmale.isSelected = true
            self.gender = user.gender ?? "male"
        }else if(user.gender == "female"){
            self.btnfemale.isSelected = true
            self.gender = user.gender ?? "female"
        }else{
            self.btnmale.isSelected = false
            self.btnfemale.isSelected = false
            self.gender = ""
        }
    }
    
    func requestToFetchUserProfile(){
        SKActivityIndicator.show()
        userhandler.getUserProfile(Success: {(rootProfile)in
            SKActivityIndicator.dismiss()
            if(rootProfile.success!){
                self.userProfile = rootProfile.data
                self.updateProfileUI()
                
                
            }else{
                SKActivityIndicator.dismiss()
                self.alertMessage(message: rootProfile.message!, completionHandler: nil)
            }
            
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: nil)
            
        })
        
        
    }
    
    
    
    @IBAction func EditImageProfileAction(_ sender: UIButton) {
       self.PickImag()
    }
    
    
    @IBAction func SaveAction(_ sender: UIButton) {
        if isValidProfileForm(){
            if let updatedImage = updatedImage{
                SKActivityIndicator.show()
                SocketEventManager.shared.uploadImage(image: updatedImage) { [weak self] (result) in
                    
                    self?.progressLabel.isHidden = false
                    switch result {
                        
                    case .progress(let value):
                        print(value)
                        self?.progressLabel.text = "\(Int(value))%"
                        
                    case .path(let fileName):
                        self?.progressLabel.isHidden = true
                         SKActivityIndicator.dismiss()
                         
                        print(fileName)
                        self?.selectedImagePath = fileName
                        self?.requestToUpdateProfile()
                    case .failure(let errorMsg):
                        self?.progressLabel.isHidden = true
                        SKActivityIndicator.dismiss()
                        self?.alertMessage(message: errorMsg, completionHandler: {
                            
                        })
                    }
                    
                    
                    
                }
            }
            else{
                self.requestToUpdateProfile()
            }
        }
        
        
        
//        if isValidProfileForm(){
//            
//            
//        }
    }
    
    
    func isValidProfileForm()->Bool{
        
        if(self.txtfirstName.text == ""){
            self.alertMessage(message: "Please Enter First Name".localized, completionHandler: nil)
            return false
        }else  if(self.txtfirstName.text!.count < 3 ||  txtfirstName.text!.count > 30){
            self.alertMessage(message: "First Name must be 3 to 30 characters".localized, completionHandler: nil)
            return false
        }else  if(self.txtlastName.text == ""){
            self.alertMessage(message: "Please Enter Last Name".localized, completionHandler: nil)
            return false
        }else  if(self.txtlastName.text!.count < 3 ||  txtlastName.text!.count > 30){
            self.alertMessage(message: "Last Name must be 3 to 30 characters".localized, completionHandler: nil)
            return false
        }else  if(self.txtemail.text == ""){
            self.alertMessage(message: "Please Enter Email".localized, completionHandler: nil)
            return false
        }else  if(self.txtemail.text?.isValidEmail1 == false){
            self.alertMessage(message: "Please Enter Valid Email".localized, completionHandler: nil)
            return false
        }else  if(self.txtemail.text!.count > 128){
            self.alertMessage(message: "Please Enter Valid Email".localized, completionHandler: nil)
            return false
        }else  if(self.txtAddress.text! == ""){
            self.alertMessage(message: "Please Enter Address".localized, completionHandler: nil)
            return false
       }
        else  if(self.txtphonenumber.text! == ""){
            self.alertMessage(message: "Please Enter PhoneNumber".localized, completionHandler: nil)
            return false
        }else  if(validateMobileNumber(value: txtphonenumber.text!)){
            self.alertMessage(message: "Please Enter Valid PhoneNumber".localized, completionHandler: nil)
            return false
        }else  if(self.txtphonenumber.text!.count < 4 ||  txtphonenumber.text!.count > 16){
            self.alertMessage(message: "Please Enter Valid PhoneNumber".localized, completionHandler: nil)
            return false
        }
        
        return true
    }
    
    
    func PickImag() {
        let alert = UIAlertController(title: "Please Select an Option".localized, message: "", preferredStyle: .actionSheet)
        
//     alert.setValue(NSAttributedString(string: "", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 29, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor : UIColor.red]), forKey: "attributedTitle")
//        
//        alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor : UIColor.green]), forKey: "attributedMessage")
        let Gallry = UIAlertAction(title: "Photo Library".localized, style: .default){ (Picimg) in self.GalleryPic()
        }
        let camraimg = UIAlertAction(title: "Camera".localized, style: .default){ (ac) in self.cemeraPic()
        }
        let cancel = UIAlertAction(title: "Cancel".localized, style: .cancel){(action) in self.cancel()
            
        }
        
        alert.addAction(Gallry)
        alert.addAction(camraimg)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    func cancel()
    {
        self.galleryimage.dismiss(animated: true, completion: nil)
    }
    
    func cemeraPic()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            cemeraimg.sourceType = .camera
            cemeraimg.delegate = self
            cemeraimg.allowsEditing = false
            present(cemeraimg, animated: true, completion: nil)
        }
        else {
            
            let alert = UIAlertController(title: "Camera".localized, message: "Camera is not available".localized, preferredStyle: .actionSheet)
            let alertaction = UIAlertAction(title: "Cancel".localized, style: .cancel)
            alert.addAction(alertaction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    func GalleryPic()
    {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
        {
            galleryimage.delegate = self
            galleryimage.allowsEditing = false
            galleryimage.sourceType = UIImagePickerController.SourceType.photoLibrary
            present(galleryimage, animated: true, completion: nil)
            
        }else{
            
            print("Image is not Available")
            
        }
        
    }
    
    
    
    
    
    
    
    
    //MARK:-EditProfileCall
    
    
    func requestToUpdateProfile(){
        
        if (btnmale.isSelected == true){
            self.gender = "male"
        }else if(btnfemale.isSelected == true){
            self.gender = "female"
        }else{
            self.gender = ""
        }
        let location = [self.my_lat,self.my_long]
        SKActivityIndicator.show()
        var dic: [String: Any] = ["firstName": self.txtfirstName.text!,
                                  "lastName": self.txtlastName.text!,
                                  "email": txtemail.text!,
                                  "phone":txtphonenumber.text! ,
                                  "address":txtAddress.text!,
                                  "gender": self.gender,
                                  "_id": self.userID,
                                  "location": location]
        
        if let path = selectedImagePath{
            dic.updateValue(path, forKey: "image")
        }
        
        userhandler.updateUserProfile(parameter: dic as NSDictionary, Success: {(SuccessResponse)in
            
            DispatchQueue.main.async {
                SKActivityIndicator.dismiss()
                self.progressLabel.isHidden = true
                
                if(SuccessResponse.success!){
                    
                    self.alertMessage(message: SuccessResponse.message!, completionHandler: {
                        AppUserDefault.shared.isUserupdate = true
                        AppUserDefault.shared.userData = SuccessResponse.data
                        self.navigationController?.popViewController(animated: true)
                        
                    })
                }else{
                    //                SKActivityIndicator.dismiss()
                    self.alertMessage(message: SuccessResponse.message ?? "", completionHandler: nil)
                    
                    self.resetUserImage()
                    
                    
                }
            }
            
            
            
        }, Falioure: {(error)in
            DispatchQueue.main.async {
                SKActivityIndicator.dismiss()
                self.alertMessage(message: error.message, completionHandler: nil)
                self.resetUserImage()
            }
        })
        
    }
    
    
    
    
    
    
    
    
}

extension VcEditProfile : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
        let img =  (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        userImage.image = img
        updatedImage = img
//        SKActivityIndicator.show()
//        SocketEventManager.shared.uploadImage(image: img) { [weak self] (result) in
//
//            self?.progressLabel.isHidden = false
//            switch result {
//
//            case .progress(let value):
//                print(value)
//                //self?.progressLabel.text = "\(Int(value))%"
//
//            case .path(let fileName):
////                SKActivityIndicator.dismiss()
//
//                print(fileName)
//                self?.selectedImagePath = fileName
//                self?.requestToUpdateProfile()
//            }
//
//        }
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
    
    



//MARK:- AutoCompleteAddress
extension VcEditProfile: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        return false
//    }
//   func textFieldDidBeginEditing(_ textField: UITextField) {
//        if textField == self.txtAddress {
//            let placePickerController = GMSAutocompleteViewController()
//            placePickerController.delegate = self
//            self.present(placePickerController, animated: true) {
//            }
//            return false
//        }
//        return true
        
        
//    txtAddress.resignFirstResponder()
//    txtphonenumber.resignFirstResponder()
//    txtemail.resignFirstResponder()
//
//    txtlastName.resignFirstResponder()
//    txtfirstName.resignFirstResponder()
        
        
//        self.view.endEditing(true)
        
        
        let locationPicker = LocationPickerViewController()
        
        
        
        locationPicker.location = location
        
        locationPicker.searchBarStyle = .prominent
        locationPicker.mapType = .standard
        locationPicker.showCurrentLocationButton = true
        locationPicker.useCurrentLocationAsHint = true
        locationPicker.selectCurrentLocationInitially = true
        
        locationPicker.completion = { location in
            self.my_lat = location?.coordinate.latitude ?? 0.0
            self.my_long = location?.coordinate.longitude ?? 0.0
            self.txtAddress.text = location?.address ?? "--"
        }
        navigationController?.pushViewController(locationPicker, animated: true)
        
        
        return false
        
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
////        if textField == self.txtAddress {
////            let autoComplete = GMSAutocompleteViewController()
////            autoComplete.delegate = self
////            UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.5843137255, green: 0.8196078431, blue: 0.3058823529, alpha: 1)
////            UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.3647058824, green: 0.6196078431, blue: 0.1176470588, alpha: 1)
////            present(autoComplete, animated: true, completion: nil)
////        }
//
//        let placePickerController = GMSAutocompleteViewController()
//        placePickerController.delegate = self
//        self.present(placePickerController, animated: true) {
//        }
////        let config = GMSPlacePickerConfig(viewport: nil)
////        let placePicker = GMSPlacePickerViewController(config: config)
////        placePicker.delegate = self
////        present(placePicker, animated: true, completion: nil)
//    }
}
//GMSAutocompleteViewControllerDelegate
//extension VcEditProfile:GMSPlacePickerViewControllerDelegate, GMSAutocompleteViewControllerDelegate {
//
//
//
//    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
//        print(place.coordinate.latitude)
//        print(place.coordinate.longitude)
//        self.my_lat = place.coordinate.latitude
//        self.my_long = place.coordinate.longitude
////        print(place.formattedAddress!)
//
//        if(place.formattedAddress == "" || place.formattedAddress == nil){
//            self.txtAddress.text = "Unknown place Cordinates Selected  ".localized + "  " +  "\(place.coordinate.latitude)" + "  " + "\(place.coordinate.longitude)"
//        }else{
//            self.txtAddress?.text = place.formattedAddress!
//        }
//
//        dismiss(animated: true, completion: nil)
//    }
//
//
//    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
//
//        print(place.coordinate.latitude)
//        print(place.coordinate.longitude)
//        self.my_lat = place.coordinate.latitude
//        self.my_long = place.coordinate.longitude
//        //        print(place.formattedAddress!)
//
//        if(place.formattedAddress == "" || place.formattedAddress == nil){
//            self.txtAddress.text = "Unknown place Cordinates Selected  ".localized + "  " +  "\(place.coordinate.latitude)" + "  " + "\(place.coordinate.longitude)"
//        }else{
//            self.txtAddress?.text = place.formattedAddress!
//        }
//
//        dismiss(animated: true, completion: nil)
//
//    }
//
//    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
//
//        viewController.dismiss(animated: true, completion: nil)
//
//        print("No place selected")
//    }
//
//    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
//
//        print("Error: ", error.localizedDescription)
//    }
//
//    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
//        dismiss(animated: true, completion:nil )
//    }
//
//
//    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//    }
//
//
//    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//        UIApplication.shared.isNetworkActivityIndicatorVisible = false
//    }
//
//    func viewController(_ viewController: GMSAutocompleteViewController, didSelect prediction: GMSAutocompletePrediction) -> Bool {
//        dismiss(animated: true, completion: nil)
//        return true
//    }
//
//
//}
