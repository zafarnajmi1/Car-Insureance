//
//  ChatVC.swift
//  CarInsurance
//
//  Created by apple on 8/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import ObjectMapper

class ChatVC: BaseImagePickerVC {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var attachBtn: LoaderButton!
    @IBOutlet weak var txtMsg: UITextField!
    
    //MARK:- Properties
    
   
    var fetchingMore = false
    var isComeFromCompanyMenu = false
    
   // var conversation: Conversation?
    var messageList = [MessageModel]()
    var page = 1
    var totalPage = 0;
    var objPage = 0;
    
    let socket = SocketIOManager.sharedInstance.getSocket()
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Live Chat".localized
        
        setupView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.txtMsg.placeholder = "Write message...".localized
        sendBtn.setTitle("Send".localized, for: .normal)
        let tfs = [txtMsg] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
    }
    
    func setupView()  {
        setNavigationBar()
        txtMsg.delegate = self
        IQKeyboardManager.shared.enableAutoToolbar = false
        tableView.keyboardDismissMode = .onDrag // .interactive
        navigationController?.hidesBarsWhenKeyboardAppears = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        imagePickerDelegate = self
        
        fetchMessageList()
        tableView.transform = CGAffineTransform (scaleX: 1,y: -1)
        
        addMenuBackButton()
        
        
        
    }
    
    override func onMenuBackButtonClciked() {
        if isComeFromCompanyMenu == true {
            AppDelegate.appDelegate.moveToHome()
        }
        else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
        IQKeyboardManager.shared.enableAutoToolbar = true
        
    }
    

    
    override func backButtonTapped()  {
       // socket.off("newConversation")
       // self.socket.off("getConversation")
        self.socket.off("messagesList")
      //  self.socket.off("conversationsList")
        self.socket.off("newMessage")
        
        
       
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
   
    
    //MARK:- FetchPagesMoreData
    func beginBatchFetch() {
        
        fetchingMore = true
        
        print(self.objPage)
        print(self.totalPage)
        
        if (self.objPage) < (self.totalPage) {
            
            page += 1
            let params = ["page": page] as [String : Any]
            self.socket.emit("messagesList", with: [params])
            
        }
        
    }
    //MARK:- SendMessage
    @IBAction func sendMessageTapped(_ sender: UIButton) {
        
        guard let msg = txtMsg.text else {
            return
        }
        if (msg  == ""){
           // nvMessage.showStatusWarning(body: "Please Write something")
             self.alertMessage(message: "Please Write something".localized, completionHandler: nil)
        }
        else{
            let params = ["content" : msg]
            self.socket.emit("sendMessage", with: [params])
            self.txtMsg.text = ""
        }
        
        
    }
    

    
    
}



extension ChatVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true);
        return false;
    }
}

extension ChatVC : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.messageList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let message = messageList.getElement(at: indexPath.row) else {
            return UITableViewCell()
        }
        
        let senderid = message.sender?.id
        
        let currentUserId = AppUserDefault.shared.userId
        if (senderid != currentUserId ) {
            return receiverSetup(message, tableView, indexPath)
        }
        else{
            return senderSetup(message, tableView, indexPath)
        }
        
        
    }
    
    
    func receiverSetup(_ message: MessageModel, _ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        
        switch message.mimeType {
            
        case "image/jpeg","image/png":
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiverImageCell") as! ReceiverImageCell
            cell.setData(message: message)
            
            return cell
            
        case "text":
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecieverTextCell") as! RecieverTextCell
            cell.setData(message: message)
            return cell
            
        default:
            
            return UITableViewCell()
        }
        
    }
    
    
    
    func senderSetup(_ message: MessageModel, _ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        
        switch message.mimeType {
            
        case "image/jpeg","image/png" :
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SenderImageCell") as! SenderImageCell
            cell.setData(message: message)
            return cell
            
        case "text":
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SenderTextCell") as! SenderTextCell
            cell.setData(message: message)
            return cell;
            
        default:
            return UITableViewCell()
        }
        
    }
    
    
}


extension Array {
    func getElement(at index: Int) -> Element? {
        let isValidIndex = index >= 0 && index < count
        return isValidIndex ? self[index] : nil
    }
}



//MARK:- implement socket
extension ChatVC {
    
    
   
    
    func fetchMessageList() {
        
           UIApplication.shared.isNetworkActivityIndicatorVisible = true
        //fetch message List
        let params = ["page": self.page] as [String : Any]
        
        self.socket.emit("messagesList", with: [params])
       
        self.socket.once("messagesList") { (data, ack) in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            let modified =  (data[0] as AnyObject)
            
            let dictionary = modified as! [String: AnyObject]
            
            print(dictionary)
            
            
            if let chat = Mapper<ChatModel>().map(JSONObject: modified) {
                
               
                self.messageList.removeAll()
                self.messageList +=  (chat.data?.messages ?? [])
                
                self.totalPage = (chat.data?.pagination?.pages ?? 0)
                print(self.totalPage)
                self.objPage =  (chat.data?.pagination?.page ?? 0)
                self.fetchingMore = false
                
            }
            
         
            
            
            
            
            self.messageList.reverse()
            self.tableView.reloadData()
           // self.tableView.switchRefreshHeader(to: .normal(.success, 0.0))
            
            
            if( self.messageList.count > 0) {
                
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .bottom, animated: false)
                
            }
            
        }
        
       
        self.socket.on("newMessage") { (data, ack) in
            
            
            let modified =  (data[0] as AnyObject)
            
            let dictionary = modified as! [String: AnyObject]
            
            print( dictionary)
            
            if let chat = Mapper<ChatModel>().map(JSONObject: modified) {
                guard let message = chat.data?.message else { return }
                
                self.messageList.insert(message, at: 0)
                
                if self.messageList.count > 0{
                    self.tableView.reloadData()
                
                    self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .bottom, animated: false)
                }
                
            }
            
            
        }
        
        
    }
    
    
}

extension ChatVC: BaseImagePickerVCDelegate {
    
    
    func mySelectedImage(image: UIImage) {
        attachBtn.showLoading()
        SocketEventManager.shared.uploadImage(image: image) { (result) in
            switch result {
            case .progress(let value):
                let counter = Int(value)
                print("File Upload Progress Status:\(counter)")
            case .path(let fileName):
                self.attachBtn.hideLoading()
                let params = ["type" : "image/jpeg",
                    "fileName" : fileName
                    ] as [String : Any]
                
                self.socket.emit("sendMessage", with: [params])
            case .failure(let errorMsg):
                self.attachBtn.hideLoading()
                self.alertMessage(message: errorMsg, completionHandler: {
                    
                })
            }
        }
    }
    
    
}
