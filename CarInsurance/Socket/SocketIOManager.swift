//
//  SocketIOManager.swift
//  SocketChat
//
//  Created by Gabriel Theodoropoulos on 1/31/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import SocketIO
import AVKit
import ObjectMapper

class SocketIOManager: NSObject {
    
    
    static let sharedInstance = SocketIOManager()
    var socket : SocketIOClient!
    var manager : SocketManager!
    //var objPlayer: AVAudioPlayer?
    //let notificaitonSoundURL = Bundle.main.url(forResource: "notification", withExtension: "mp3")
    var playNotificationSound : Bool = true
    /*"log": true,
     "compress": true,
     "forcePolling": true,
     "forceNew": true*/
    //"locale" : "en"
   private func getConfigrations() -> SocketIOClientConfiguration! {
  
        if let token  = UserDefaults.standard.value(forKey: "userAuthToken") as? String{
            
            let usertoken = [
                "token":  token,
                "locale" : "en"
                
            ]
            
            let specs : SocketIOClientConfiguration = [
            .forcePolling(true),
            .forceWebsockets(true),
            .compress,
            .path("/car-insurance/socket.io"),
            .connectParams(usertoken),
            .log(true)]
        print("Socket Specs :\(specs)")
            return specs
        }
        else{
            let specs : SocketIOClientConfiguration = [
                .forcePolling(true),
                .forceWebsockets(true),
                .compress,
                .path("/car-insurance/socket.io"),
                .log(true)]
            print("Socket Specs :\(specs)")
            return specs
        }

    }
    
    private override init() {
        super.init()
        setupSocket()
    }
    func setupAndEstablisConnection(){
        self.setupSocket()
        self.establishConnection()
    }
    
    //--
    
    func setupSocket(){
        let url = URL(string: "https://www.projects.mytechnology.ae/car-insurance/")
        manager = SocketManager(socketURL: url! , config: getConfigrations())
        socket = manager.defaultSocket
    }
    
    func getSocket() -> SocketIOClient {
        return socket
    }



     // --
    func establishConnection() {
        socket.connect()
        socket.on("connected") { [weak self] (data, emitter) in
            print("Scoket ON connected respone :\(data)")
            self?.startListeningCommonMethods()
        }
//        startListeningCommonMethods()
    }

    // --
    func closeConnection() {
        socket.disconnect()
    }
    
    @discardableResult
    func once(_ event: String, callback: @escaping NormalCallback) -> UUID {
        return self.socket.once(event, callback: callback)
    }
    
    @discardableResult
    func on(_ event: String, onList addIn : inout [String], callback: @escaping NormalCallback) -> UUID {
        
        
//            addIn.append(event)
        
//        onEvents.append(event)
        return self.socket.on(event, callback: callback)
        
    }
    
    @discardableResult
    func on(_ event: String, addToOff value: Bool = true, callback: @escaping NormalCallback) -> UUID {
        
//        if value {
//            onEvents.append(event)
//        }
//        else{
//            print("Event will not turned OFF :\(event)")
//        }
        
        return self.socket.on(event, callback: callback)
        
    }
    func emit(_ event: String){
        self.socket.emit(event)
    }
    func emit(_ event: String, with items: [Any]){
        self.socket.emit(event, with: items)
    }
    func emit(_ event: String, with items: [Any] , completion: (() -> ())? = nil){
        self.socket.emit(event, with: items , completion: completion)
    }
    
    func startListeningCommonMethods() {
        
        
        
        
        
//        socket.on("notificationsChanged"){(data, ack)in
//            self.socket.emit("unseenNotifications")
//        }
        
        
        
        self.socket.on("newNotification") { (data, ack) in
            let modified =  (data[0] as AnyObject)
            
            let dictionary = modified as! [String: AnyObject]
            print(dictionary)
            if(self.playNotificationSound){
                self.playAudioFile()
            }
            self.socket.emit("unseenNotifications")
            
        }
        
        self.socket.on("unseenNotifications") { (data, ack) in
            let modified =  (data[0] as AnyObject)
            let dictionary = modified as! [String: AnyObject]
            print("unseenNotifications ON : \(dictionary)")
            if let obj =  Mapper<UnseenNotificationAPIResponse>().map(JSONObject: modified) {
                AppUserDefault.shared.unseenNotification = obj.data?.total ?? 0
            }
   
        }
        self.socket.emit("unseenNotifications")
//        socket.on(clientEvent: .disconnect) { (data, ack) in
//            print("Disconnet Data :\(data)")
//        }
        
//        socket.on(clientEvent: .statusChange) { (data, ack) in
//            print("Disconnet Data Status Chagne:\(data)")
//        }
//        socket.didDisconnect(reason: "No Idea")
    }
    func stopListeningCommonEvents(events : [String] = []){
        for event in events {
            print("Closing Event :\(event)")
            self.socket.off(event)
        }
    }
    
    
    
    
    
    
    func playAudioFile() {
//        guard let url = Bundle.main.url(forResource: "notification", withExtension: "mp3") else { return }
//        do {
//            let audioPlayer = try AVAudioPlayer(contentsOf: notificaitonSoundURL!)
//            audioPlayer.play()
//        }
//        catch let error {
//            print("Notification could not played Error :\(error)")
//        }
        
        AudioServicesPlayAlertSound(SystemSoundID(1322))
    }
}
