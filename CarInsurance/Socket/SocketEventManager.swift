//
//  SocketEventManager.swift
//  TailerOnline
//
//  Created by apple on 4/18/19.
//  Copyright © 2019 mytechnology. All rights reserved.
//

import UIKit
import  Foundation


class SocketEventManager {
    
    static let shared = SocketEventManager()
    
    
    func uploadImage(image: UIImage,completion:@escaping (UploadResponse<Double,String,String>) -> Void) {
        
        let socket = SocketIOManager.sharedInstance.getSocket()
        
        let selectedImageResized = image.resizeImage(newHeight: 600)
        
        
        
        let imagedata : NSData = NSData(data: selectedImageResized.jpegData(compressionQuality: 1.0)!)
        
        let imageSize : Int  = imagedata.length
        print(Double(imageSize))
        print( imagedata as Data)
        
        
        let ImageDataToServer: [String:Any] = ["name": "test.png",
                                               "size": Double(imageSize)]
        print(ImageDataToServer)
        
        socket.emit("startFileUpload", with: [ImageDataToServer])
        
        socket.on("startUpload"){(data, ack)in
            let changeData = (data[0] as AnyObject)
            let ImagDictinary = changeData as! [String:AnyObject]
            print(ImagDictinary)
        }
        
        
        let imgData = imagedata as Data
        let uploadChunksize = 102400
        let totalsize = imgData.count
        var offset = 0
        
        socket.on("moreData"){(data, ack)in
            
            let modified = (data[0] as AnyObject)
            let OtherImageDictinary = modified as! [String: AnyObject]
            let moredata = MoreData(dictionary: OtherImageDictinary as NSDictionary)
            print(OtherImageDictinary)
            
            completion(.progress(Double(moredata?.data?.percent ?? 0)))
            
            
            let imageData = imagedata as Data
            imageData.withUnsafeBytes{(u8Ptr:UnsafePointer<UInt8>)in
                let mutRawPointer = UnsafeMutableRawPointer(mutating: u8Ptr)
                print(totalsize)
                
                let chunkSize = offset + uploadChunksize > totalsize ? totalsize - offset : uploadChunksize
                let chunk = Data(bytesNoCopy: mutRawPointer+offset, count: chunkSize, deallocator: Data.Deallocator.none)
                offset += chunkSize
                
                let chunkSize2 = chunk.count
                
                let imageDataupload:[String : Any]  = [
                    "fileName":   "test.png",
                    "data" : chunk as NSData ,
                    "pointer" : moredata!.data!.pointer! ,
                    "chunkSize" : chunkSize2
                ]
                
                
                print(imageDataupload)
                
                socket.emit("uploadChunk", with: [imageDataupload])
                
            }
        }

        
        socket.on("uploadCompleted") { (data, ack) in
            
            self.turnoffAllEvents()
            
            
            let modified =  (data[0] as AnyObject)
            
            //Map your response Object
            
            let dictionary = modified as! [String: AnyObject]
            if let MyFiledata = CompleteChat.init(dictionary: dictionary as NSDictionary){
                completion(.path(MyFiledata.data!.fileName ?? ""))
            }else{
                print("Error")
            }
            
//            if let rootModel = Mapper<RootUploadCompleteModel>().map(JSONObject: modified) {
//                let path = (rootModel.data?.fileName!)!
//                completion(.path(path))
//            }
//            else {
//                nvMessage.showStatusError(body: "Response Changed")
//            }
            
            
            
            
        }
        socket.on(clientEvent: .error) { (data, ack) in
            print("Disconnet Data Error:\(data)")
        }

        socket.on(clientEvent: .error) { (data, ack) in
            print("Disconnet Data Error:\(data)")
            
            var error = "Unknown Error"
            
            if let response = data as? [String]{
                if response.count > 0{
                    error = response[0]
                }
                
            }
            completion(.failure(error))
            
            
            
            
        }
    
    }
    
    func turnoffAllEvents(){
        let socket = SocketIOManager.sharedInstance.getSocket()
        socket.off("startUpload")
        socket.off("moreData")
        socket.off("uploadCompleted")
        socket.off(clientEvent: .error)
        
    }
//    func uploadAudioFile(url: URL,completion:@escaping (UploadResponse<Double,String>) -> Void) {
//
//        let socket = SocketIOManager.sharedInstance.getSocket()
//
//         var imagedata = Data()
//
//
//        do {
//            imagedata = try Data(contentsOf: url)
//        } catch {
//            print ("loading image file error")
//        }
//
//
//        let imageSize : Int  = imagedata.count
//        print(Double(imageSize))
//        print( imagedata as Data)
//
//
//        let ImageDataToServer: [String:Any] = ["name": "recording.m4a",
//                                               "size": Double(imageSize)]
//        print(ImageDataToServer)
//
//        socket.emit("startFileUpload", with: [ImageDataToServer])
//
//        socket.on("startUpload"){(data, ack)in
//            let changeData = (data[0] as AnyObject)
//            let ImagDictinary = changeData as! [String:AnyObject]
//            print(ImagDictinary)
//        }
//
//
//        let imgData = imagedata as Data
//        let uploadChunksize = 102400
//        let totalsize = imgData.count
//        var offset = 0
//
//        socket.on("moreData"){(data, ack)in
//
//            let modified = (data[0] as AnyObject)
//            let OtherImageDictinary = modified as! [String: AnyObject]
//            let moredata = MoreData(dictionary: OtherImageDictinary as NSDictionary)
//            print(OtherImageDictinary)
//
//            completion(.progress(Double(moredata?.data?.percent ?? 0)))
//
//
//            let imageData = imagedata as Data
//            imageData.withUnsafeBytes{(u8Ptr:UnsafePointer<UInt8>)in
//                let mutRawPointer = UnsafeMutableRawPointer(mutating: u8Ptr)
//                print(totalsize)
//
//                let chunkSize = offset + uploadChunksize > totalsize ? totalsize - offset : uploadChunksize
//                let chunk = Data(bytesNoCopy: mutRawPointer+offset, count: chunkSize, deallocator: Data.Deallocator.none)
//                offset += chunkSize
//
//                let chunkSize2 = chunk.count
//
//                let imageDataupload:[String : Any]  = [
//                    "fileName":   "recording.m4a",
//                    "data" : chunk as NSData ,
//                    "pointer" : moredata!.data!.pointer! ,
//                    "chunkSize" : chunkSize2
//                ]
//
//
//                print(imageDataupload)
//
//                socket.emit("uploadChunk", with: [imageDataupload])
//
//            }
//        }
//
//        socket.on("uploadCompleted") { (data, ack) in
//
//
//            socket.off("startUpload")
//            socket.off("moreData")
//            socket.off("uploadCompleted")
//
//            let modified =  (data[0] as AnyObject)
//
//            let dictionary = modified as! [String: AnyObject]
//            if let MyFiledata = CompleteChat.init(dictionary: dictionary as NSDictionary){
//                completion(.path(MyFiledata.data!.fileName ?? ""))
//            }else{
//                print("Error")
//            }
//
//            //Map your response Object
//
//            //let moredata = MoreData(dictionary: modified as! NSDictionary)
//
////            if let rootModel = Mapper<RootUploadCompleteModel>().map(JSONObject: modified) {
////                let path = (rootModel.data?.fileName!)!
////                completion(.path(path))
////            }
////            else {
////                nvMessage.showStatusError(body: "Response Changed")
////            }
//
//
//
//
//        }
//    }
    
    
}
