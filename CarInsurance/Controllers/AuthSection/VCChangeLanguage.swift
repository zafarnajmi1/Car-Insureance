//
//  VCChangeLanguage.swift
//  CarInsurance
//
//  Created by Apple on 7/1/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class VCChangeLanguage: UIViewController {
let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var btnsave: UIButton!
    @IBOutlet weak var lblremeberme: UILabel!
    @IBOutlet weak var saveimgcheck: UIImageView!
    
    @IBOutlet weak var englishTick: UIImageView!
    @IBOutlet weak var arabicTick: UIImageView!
    @IBOutlet weak var lbllanguagDiscription: UILabel!
    @IBOutlet weak var lblchangelanguage: UILabel!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var btnArabic: UIButton!
    @IBOutlet weak var languageView: UIView!
    var isSave: Bool = true
    var isfromSetting : Bool = false
    var fromsplash : Bool = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //btnArabic.isEnabled = false
        if isfromSetting{
            self.navigationItem.hidesBackButton = false
            self.addBackButton()
//            if (myDefaultLanguage == .en){
//                
//            }else{
//                addArabicBackButton()
//            }
        }
        else{
         self.navigationItem.hidesBackButton = true
        }
        
                if AppUserDefault.shared.isLanguageRemembered == true {
                    
                        saveimgcheck.image = UIImage.init(named: "GreenCheckBox")
                    
                }else{
                        saveimgcheck.image = UIImage.init(named: "Square")
                }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setNavigationBar()
        setView()
    }
    
    
    
    
    func setView() {
       
       self.navigationController?.navigationBar.isHidden = false;
        self.title = "Change Language".localized
        self.languageView.setcornerUiview(Corner: 6)
        self.btnContinue.setcornerButton(Corner: 10)
        
        if myDefaultLanguage == .ar {
            arabicAction( UIButton())
        }else{
            EnglishAction( UIButton())
        }
        
        
        lblremeberme.text = "Remember my Choice".localized
        lblchangelanguage.text = "Change Language".localized
        lbllanguagDiscription.text = "Choose any language to continue with ".localized
        btnContinue.setTitle("Continue".localized, for: .normal)
        
    }
  
    @IBAction func EnglishAction(_ sender: UIButton) {
        
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        arabicTick.image = UIImage.init(named: "CircleUnCheck")
       
        englishTick.image = UIImage.init(named: "CircleCheck")
     
        myDefaultLanguage = .en
        AppUserDefault.shared.saveLanguage = myDefaultLanguage.rawValue
    }
    
    @IBAction func arabicAction(_ sender: UIButton) {
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
       
        englishTick.image = UIImage.init(named: "CircleUnCheck")
        
        arabicTick.image = UIImage.init(named: "CircleCheck")
       
        myDefaultLanguage = .ar
        AppUserDefault.shared.saveLanguage = myDefaultLanguage.rawValue

        
    }
    @IBAction func continueAction(_ sender: UIButton) {
        
        if isfromSetting{
           self.navigationController?.popViewController(animated: true)
        }
        else{
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "VCLoginORCreateAccount") as! VCLoginORCreateAccount
//            self.navigationController?.pushViewController(vc, animated: true)
             let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            switch myDefaultAccount {
            case .customer:
                AppDelegate.appDelegate.moveToUserHome()
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "VCTabbarHome") as! VCTabbarHome
//                self.navigationController?.pushViewController(vc, animated: true)
            case .organization:
                appDelegate.moveToHome()
            default:
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "VCLoginORCreateAccount") as! VCLoginORCreateAccount
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            
            
        }
        
    }
    
    
    @IBAction func savelanguage(_ sender: UIButton) {
        if isSave  {
            saveimgcheck.image = UIImage.init(named: "GreenCheckBox")
            AppUserDefault.shared.isLanguageRemembered = true
            isSave = false
        }
        else {
            saveimgcheck.image = UIImage.init(named: "Square")
            AppUserDefault.shared.isLanguageRemembered = false
            isSave = true
        }

        
    }
    
    
}
