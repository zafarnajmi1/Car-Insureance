//
//  VcConversation.swift
//  CarInsurance
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class VcConversation: UIViewController {

    //var delegate: LeftMenuProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Conversation".localized
        self.setConversationView()
        self.setNavigationBar()
        
        if ( AppUserDefault.shared.accountType == "5d08c0d814068021482f9d2d"){
            self.addBackButton()
//            if (myDefaultLanguage == .en){
//            
//            }else{
//                self.addArabicBackButton()
//            }
        }else{
            addMenuBackButton()
//            if (myDefaultLanguage == .en){
//
//            }else{
//                addArabicMenuBackButton()
//            }
            
        }
    }
    func setConversationView(){
        
        
        
    }

}
extension VcConversation: UITableViewDataSource, UITableViewDelegate{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CellConversation") as? CellConversation
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
}
