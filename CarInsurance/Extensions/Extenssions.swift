//
//  Extenssions.swift
//  CarInsurance
//
//  Created by Apple on 7/1/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func setcornerUiview(Corner: Int){
        self.layer.cornerRadius = CGFloat(Corner)
        self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.borderWidth = 0.5
        self.clipsToBounds = true
        
    }
    
    func setcornerUiviewchangeColor(Corner: Int){
        self.layer.cornerRadius = CGFloat(Corner)
        self.layer.borderColor = #colorLiteral(red: 0.9411764706, green: 0.9450980392, blue: 0.9490196078, alpha: 1)
        self.layer.borderWidth = 1
        self.clipsToBounds = true
        
    }
    func setcornerUiviewchangeColorshadow(Corner: Int){
        self.layer.cornerRadius = CGFloat(Corner)
        self.layer.borderColor = #colorLiteral(red: 0.9411764706, green: 0.9450980392, blue: 0.9490196078, alpha: 1)
        self.layer.borderWidth = 1
        self.clipsToBounds = true
        
        
        
        let shadowOffsetWidth: Int = 0
        let shadowOffsetHeight: Int = 1
        let shadowColor: UIColor? = UIColor.lightGray
        let shadowOpacity: Float = 0.1
        
       
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: CGFloat(Corner))
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        
    }
    
    func setcornerUiviewNoborder(Corner: Int){
        self.layer.cornerRadius = CGFloat(Corner)
        self.clipsToBounds = true
        
    }
    func setroundUiView(){
        self.layer.cornerRadius = frame.height/2
        self.clipsToBounds = true
        
    }
    /* @IBInspectable var cornerRadius: CGFloat = 2
     @IBInspectable var shadowOffsetWidth: Int = 0
     @IBInspectable var shadowOffsetHeight: Int = 3
     @IBInspectable var shadowColor: UIColor? = UIColor.lightGray
     @IBInspectable var shadowOpacity: Float = 0.5
     
     override func layoutSubviews() {
     layer.cornerRadius = cornerRadius
     let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
     
     layer.masksToBounds = false
     layer.shadowColor = shadowColor?.cgColor
     layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
     layer.shadowOpacity = shadowOpacity
     layer.shadowPath = shadowPath.cgPath
     }*/
    
    
    
    func Myshadow(){
        
        
        
        let cornerRadius: CGFloat = 0
        let shadowOffsetWidth: Int = 0
        let shadowOffsetHeight: Int = 0
        let shadowColor: UIColor? = UIColor.lightGray
        let shadowOpacity: Float = 0.2
        
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        
    }
    
    func cardViewUiview(){
        
        
        
        let cornerRadius: CGFloat = 0
        let shadowOffsetWidth: Int = 0
        let shadowOffsetHeight: Int = 1
        let shadowColor: UIColor? = UIColor.lightGray
        let shadowOpacity: Float = 0.2
        
            layer.cornerRadius = cornerRadius
            let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
            
            layer.masksToBounds = false
            layer.shadowColor = shadowColor?.cgColor
            layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
            layer.shadowOpacity = shadowOpacity
            layer.shadowPath = shadowPath.cgPath
      
        
//        //self.layer.borderWidth = 0.5
//       //self.layer.borderColor = UIColor.lightGray.cgColor
//        self.layer.masksToBounds = true
//        self.layer.shadowColor = UIColor.lightGray.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
//        self.layer.shadowRadius = 0.0
//       self.layer.shadowOpacity = 0.5
//        self.layer.masksToBounds = false
//
//        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.cornerRadius).cgPath
        
    }
    enum VerticalLocation: String {
        case bottom
        case top
    }
    
    
    func addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.1, radius: CGFloat = 1.0) {
        switch location {
        case .bottom:
            addShadow(offset: CGSize(width: 0, height: 1), color: color, opacity: opacity, radius: radius)
        case .top:
            addShadow(offset: CGSize(width: 0, height: -1), color: color, opacity: opacity, radius: radius)
        }
    }
    
    func addShadow(offset: CGSize, color: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), opacity: Float = 0.1, radius: CGFloat = 1.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    
    
    func addShadow1(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.1, radius: CGFloat = 1.0) {
        switch location {
        case .bottom:
            addShadow1(offset: CGSize(width: 0, height: 0.5), color: color, opacity: opacity, radius: radius)
        case .top:
            addShadow1(offset: CGSize(width: 0, height: -0.5), color: color, opacity: opacity, radius: radius)
        }
    }
    
    func addShadow1(offset: CGSize, color: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), opacity: Float = 0.1, radius: CGFloat = 1.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    
    
}



extension UIImageView{
    func setcornerImage(Corner: Int){
        self.layer.cornerRadius = CGFloat(Corner)
        self.clipsToBounds = true
        
    }
    
    func setRoundimage(){
        self.layer.cornerRadius = frame.height/2
        self.clipsToBounds = true
        
    }
    
}



extension UIButton{
    
    func setcornerButton(Corner: Int){
        
        self.layer.cornerRadius = CGFloat(Corner)
        self.clipsToBounds = true
        
    }
    
    func setRoundbutton(){
        self.layer.cornerRadius = frame.height/2
        self.clipsToBounds = true
        
    }
    
}

extension UIViewController {
    
    func hideNavigationBar(animated: Bool = false) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func showNavigationBar(animated: Bool = false) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    public func transparetNavigationbarWithoutExtensing() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    public func transparetNavigationbar() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.backgroundColor = .clear
        edgesForExtendedLayout = .top
    }
    
    
    ///EZSE: Dismisses the view controller that was presented modally by the view controller.
    open func dismissVC(completion: (() -> Void)? ) {
        dismiss(animated: true, completion: completion)
    }
    
    public func setNavigationBar(){
        
        let view = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
        if let statusBarView = view  {
            statusBarView.backgroundColor =  #colorLiteral(red: 0.4156862745, green: 0.6588235294, blue: 0.1490196078, alpha: 1)//theme.statusBarBgColor
        }
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let navColor = UIColor(red: 150/255, green: 209/255, blue: 78/255, alpha: 1.0)
        let color: UIColor = navColor
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor(red: 223/255, green: 48/255, blue: 81/255, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont(name: "JosefinSans-SemiBold", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
        
        if myDefaultLanguage == .ar{
            self.navigationController?.navigationBar.semanticContentAttribute = .forceRightToLeft
            
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }else{
            self.navigationController?.navigationBar.semanticContentAttribute = .forceLeftToRight
            
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
    }
}


extension UIViewController{
    
    
    func hideBackButton() {
        navigationItem.hidesBackButton = true
    }
    
    func addBackButton() {
        hideBackButton()
       var  backImage: UIImage = #imageLiteral(resourceName: "BackArrow")
        if myDefaultLanguage == .ar {
            //RTL
            backImage = #imageLiteral(resourceName: "Arrow")
        }
        let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem  = backButton
    }
    
    func addArabicBackButton() {
        hideBackButton()
        let backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Arrow"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
        dismissVC(completion: nil)
        
    }
    
    
    //MARK: ForMENUControllers
    
    
    func addMenuBackButton() {
        hideBackButton()
        //default lang: en -> LTR
        var backImage: UIImage = #imageLiteral(resourceName: "BackArrow")
        if myDefaultLanguage == .ar {
            //RTL
            backImage = #imageLiteral(resourceName: "Arrow")
        }
        
        let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(onMenuBackButtonClciked))
        navigationItem.leftBarButtonItem  = backButton
    }
    func addArabicMenuBackButton(backImage: UIImage = #imageLiteral(resourceName: "Arrow")) {
        hideBackButton()
        let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(onMenuBackButtonClciked))
        navigationItem.leftBarButtonItem  = backButton
    }
    @objc func onMenuBackButtonClciked() {
        navigationController?.popViewController(animated: true)
        dismissVC(completion: nil)
        
        if myDefaultAccount == .organization {
             AppDelegate.appDelegate.moveToHome()
        }
        
    }
    
    func alertMessage(message:String,completionHandler:(()->())?) {
        let alert = UIAlertController(title:"", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok".localized, style: .default) { (action:UIAlertAction) in
            completionHandler?()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertConfirmation(title: String = "Alert".localized, message: String, yes: @escaping () -> Void, no: (() -> Void)? ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let options = ["NO".localized, "YES".localized]
        
        for (index, option) in options.enumerated() {
            if index == 0 {
                alertController.addAction(UIAlertAction.init(title: option, style: .cancel, handler: { (action) in
                    no?()
                    
                }))
            }
            else {
                alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                    yes()
                }))
            }
            
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    static func topVC() -> UIViewController?{
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        if let rootVC = rootVC as? UINavigationController{
            return rootVC.topViewController
        }
        else if let tabVC = rootVC as? UITabBarController{
            if let selectedNav = tabVC.selectedViewController as? UINavigationController{
                return selectedNav.topViewController
            }
            else{
                return tabVC.selectedViewController
            }
        }
        else{
            return rootVC
        }
        
    }
    
    
    
    

}
extension UISegmentedControl {
    
    func defaultConfiguration(color: UIColor ) {

        let attributes = [NSAttributedString.Key.font:  UIFont(name: "JosefinSans-Regular", size: 18.0)!, NSAttributedString.Key.foregroundColor: color]
        
        setTitleTextAttributes(attributes, for: .normal)
    }
    
    
}
extension String{
    
    
        func isValidEmail() -> Bool {
            
            let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        }
    
    var isValidEmail1: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    
    
   
    
}
extension UITableView {
    
    @IBInspectable
    var isEmptyRowsHidden: Bool {
        get {
            return tableFooterView != nil
        }
        set {
            if newValue {
                tableFooterView = UIView(frame: .zero)
            } else {
                tableFooterView = nil
            }
        }
    }
}

extension UISwitch {
    
    func setSwitchView(width: CGFloat, height: CGFloat) {
        
        let standardHeight: CGFloat = 31
        let standardWidth: CGFloat = 51
        
        let heightRatio = height / standardHeight
        let widthRatio = width / standardWidth
        
        transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
    }
}
extension UIViewController{
    
    
    
    func guestAlert(){
        let loginAlert = UIAlertController(title: "Car Insurance".localized, message: "Please Log in first".localized, preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "Login".localized, style: .default) { (action) in
            
            let sb = UIStoryboard.init(name: "Main".localized, bundle: nil)
            
            
            if let loginORCreateAccount = sb.instantiateViewController(withIdentifier: "VCLoginORCreateAccount") as? VCLoginORCreateAccount{
                loginORCreateAccount.isComeFromHome = true
                let nvc: UINavigationController = UINavigationController(rootViewController: loginORCreateAccount)
                //self.navigationController?.pushViewController(nvc, animated: true)
               self.present(nvc, animated: true, completion: nil)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel".localized, style: .destructive, handler: nil)
        
        loginAlert.addAction(okAction)
        loginAlert.addAction(cancelAction)
        self.present(loginAlert, animated: true, completion: nil)
    }
    
    
    
    func guestAlertForQuotes(){
        let loginAlert = UIAlertController(title: "Cars Insurance".localized, message: "Please Log in first".localized, preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "Login".localized, style: .default) { (action) in
            
            let sb = UIStoryboard.init(name: "Main".localized, bundle: nil)
            
            
            if let loginORCreateAccount = sb.instantiateViewController(withIdentifier: "VCLoginORCreateAccount") as? VCLoginORCreateAccount{
                loginORCreateAccount.isComeFromHome = true
                let nvc: UINavigationController = UINavigationController(rootViewController: loginORCreateAccount)
                //self.navigationController?.pushViewController(nvc, animated: true)
                self.present(nvc, animated: true, completion: nil)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel".localized, style: .destructive, handler: {(action)in
            
            self.tabBarController?.selectedIndex = 0
            
        })
        
        loginAlert.addAction(okAction)
        loginAlert.addAction(cancelAction)
        self.present(loginAlert, animated: true, completion: nil)
    }
    
    
}
extension UIImage {
    
    func saveToDocuments(filename:String) {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent(filename)
        if let data = self.jpegData(compressionQuality: 1.0) {
            do {
                try data.write(to: fileURL)
            } catch {
                print("error saving file to documents:", error)
            }
        }
    }
    
    
    func resizeImage(newHeight: CGFloat) -> UIImage {
        let scale = newHeight / self.size.height
        let newWidth = self.size.width * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    
}
extension UITextField {
    @IBInspectable var padding: Int{
        get { return 0 }  // maybe use associated objects, you can't add properties in extensions
        set {
            addleftRightPading(left : newValue, right: newValue)
        }
    }
    func addleftPading(_ value : Int = 22){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: value, height: 40))
        view.isUserInteractionEnabled = false
        leftView = view
        leftViewMode = .always
        
    }
    func addRightPading(_ value : Int = 22){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: value, height: 40))
        view.isUserInteractionEnabled = false
        rightView = view
        rightViewMode = .always
    }
    func addleftRightPading(left : Int = 22, right: Int = 22){
        addleftPading(left)
        addRightPading(right)
    }
}
func isValid(email: String)->Bool {
    
    let  emailregX =  "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let  nsValue = NSPredicate(format:"SELF MATCHES %@", emailregX)
    
    return  nsValue.evaluate(with: email)
}

func validateMobileNumber(value: String) -> Bool {
    let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
    let result =  phoneTest.evaluate(with: value)
    return result
}
extension  UIViewController {
    
    /// pop back to specific viewcontroller
    func popBack<T: UIViewController>(toControllerType: T.Type) {
        if var viewControllers: [UIViewController] = self.navigationController?.viewControllers {
            viewControllers = viewControllers.reversed()
            for currentViewController in viewControllers {
                if currentViewController .isKind(of: toControllerType) {
                    self.navigationController?.popToViewController(currentViewController, animated: true)
                    break
                }
            }
        }
    }
}

extension UIImageView {
    
    //image text should not be contained
    func flipHorizantal()  {
        
        let flippedImage = self.image?.withHorizontallyFlippedOrientation()
        self.image = flippedImage
    }
}
extension UIImage {
    
    //image text should not be contained
    func flipHorizantal()  {
        
         self.withHorizontallyFlippedOrientation()
       
    }
}
