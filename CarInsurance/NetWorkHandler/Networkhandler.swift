//
//  Networkhandler.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import AlamofireImage
import Alamofire
import AlamofireObjectMapper
class Networkhandler{
    

class func PostRequiest(url: String, parameters: Parameters?, success:@escaping (Any?)->Void ,Falioure: @escaping (NetworkError) -> Void )
    {
        let Manger = Alamofire.SessionManager.default
        var Headers : HTTPHeaders
        // UserDefaults.standard.set(authToken, forKey: "userAuthToken")
        print(UserDefaults.standard.value(forKey: "userAuthToken"))
        if let userToken = UserDefaults.standard.value(forKey: "userAuthToken") as? String {
            Headers = [
                "Accept": "application/json",
                "Authorization"  : userToken   //"Authorization"
            ]
        } else {
            Headers = [
                "Accept": "application/json"
            ]
        }
        
        Manger.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: Headers).validate(statusCode: 200..<600).responseJSON{ (response)-> Void in
            
            switch(response.result)
            {
            case .success:
                let ModelRespons = response.result.value
                print(ModelRespons!)
                success(ModelRespons)
                print(ModelRespons!)
                break
            case .failure (let error):
                
                var networkError = NetworkError()
                
                if error._code == NSURLErrorTimedOut {
                    networkError.status = Constant.NetworkErrorType.timout
                    networkError.message = Constant.NetworkErrorType.timoutError
                    
                    Falioure(networkError)
                } else if error._code == NSURLErrorNetworkConnectionLost{
                    networkError.status = Constant.NetworkErrorType.internet
                    networkError.message = Constant.NetworkErrorType.internetError
                    
                    Falioure(networkError)
                }else if error._code == NSURLErrorNotConnectedToInternet{
                    networkError.status = Constant.NetworkErrorType.internet
                    networkError.message = Constant.NetworkErrorType.internetError
                    
                    Falioure(networkError)
                }else if error._code == NSURLErrorCannotConnectToHost {
                    networkError.status = Constant.NetworkErrorType.serverErrorCode
                    networkError.message = Constant.NetworkErrorType.serverError
                    
                    Falioure(networkError)
                }else if error._code == NSURLErrorSecureConnectionFailed{
                    networkError.status = Constant.NetworkErrorType.serverErrorCode
                    networkError.message = Constant.NetworkErrorType.serverError
                    
                    Falioure(networkError)
                    
                }else{
                    
                    networkError.status = Constant.NetworkErrorType.generic
                    networkError.message = Constant.NetworkErrorType.genericError
                    
                    Falioure(networkError)
                }
                break
            }
            
            
        }
        
        
    }
    
    
    
    
    class func GetRequiest(url: String, parameters: Parameters?, success: @escaping (Any?)->Void, Falioure: @escaping (NetworkError) -> Void)   {
        
        let Manger = Alamofire.SessionManager.default
        
        let  Headers : HTTPHeaders
        if let userToken = UserDefaults.standard.value(forKey: "userAuthToken") as? String {
            Headers = [
                "Accept": "application/json",
                "Authorization" : userToken
            ]
        } else {
            Headers = [
                "Accept": "application/json"
            ]
        }
        
        Manger.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Headers).validate(statusCode: 200..<600).responseJSON(completionHandler:{(response) -> Void in
            
            switch(response.result)
            {
                
            case .success:
                let RespomseModel = response.result.value
                print(RespomseModel!)
                success(RespomseModel!)
            case .failure (let error):
                
                
                var networkError = NetworkError()
                
                if error._code == NSURLErrorTimedOut {
                    networkError.status = Constant.NetworkErrorType.timout
                    networkError.message = Constant.NetworkErrorType.timoutError
                    
                    Falioure(networkError)
                } else if error._code == NSURLErrorNetworkConnectionLost {
                    networkError.status = Constant.NetworkErrorType.internet
                    networkError.message = Constant.NetworkErrorType.internetError
                    
                    Falioure(networkError)
                }else if error._code == NSURLErrorNotConnectedToInternet{
                    networkError.status = Constant.NetworkErrorType.internet
                    networkError.message = Constant.NetworkErrorType.internetError
                    
                    Falioure(networkError)
                }else if error._code == NSURLErrorCannotConnectToHost {
                    networkError.status = Constant.NetworkErrorType.serverErrorCode
                    networkError.message = Constant.NetworkErrorType.serverError
                    
                    Falioure(networkError)
                }else if error._code == NSURLErrorSecureConnectionFailed{
                    networkError.status = Constant.NetworkErrorType.serverErrorCode
                    networkError.message = Constant.NetworkErrorType.serverError
                    
                    Falioure(networkError)
                    
                }else{
                    
                    networkError.status = Constant.NetworkErrorType.generic
                    networkError.message = Constant.NetworkErrorType.genericError
                    
                    Falioure(networkError)
                }
                break
            }
            
        } )
        
    }
    
    
    class func UploadData(url: String, parameters: Parameters?,userimg: UIImage,Progress: @escaping (Int) ->Void, Success: @escaping (Any?)->Void, Falioure: @escaping (NetworkError) -> Void)
    {
        var Headers : HTTPHeaders
        let Manger = Alamofire.SessionManager.default
        if let userToken = UserDefaults.standard.value(forKey: "userAuthToken") as? String {
            Headers = [
                "Accept": "application/json",
                "Authorization" : userToken,
                "Content-type": "multipart/form-data"
            ]
        }else
        {
            Headers = ["Accept": "application/json"]
        }
        
        let type = "any"
        let fileName = "image"
        
        Manger.upload(multipartFormData: {(multipart) in
            
            if let data = userimg.jpegData(compressionQuality: 0.1)
            {
                print(data)
                multipart.append(data, withName: "image", fileName: fileName, mimeType: type)
            }
            for(key, values ) in parameters!
            {
                multipart.append((values as! String).data(using: String.Encoding.utf8)!, withName: key)
                print(values)
                print(values)
            }
            
        }, usingThreshold: UInt64.init(), to: url, method: .post, headers: Headers, encodingCompletion:{(result) in
            switch(result)
            {
            case .success(let request,_,_):
                request.uploadProgress(closure: { (prgrs) in
                    
                    let progress = Int(prgrs.fractionCompleted * 100)
                    print(progress)
                    Progress(progress)
                })
                request.responseJSON(completionHandler: {(successresponse)in
                    
                    switch(successresponse.result)
                    {
                    case .success:
                        let resultValue = successresponse.result.value
                        print(resultValue!)
                        Success(resultValue)
                        break
                        
                    case .failure (let error):
                        
                        
                        var networkError = NetworkError()
                        
                        if error._code == NSURLErrorTimedOut {
                            networkError.status = Constant.NetworkErrorType.timout
                            networkError.message = Constant.NetworkErrorType.timoutError
                            
                            Falioure(networkError)
                        } else if error._code == NSURLErrorNetworkConnectionLost {
                            networkError.status = Constant.NetworkErrorType.internet
                            networkError.message = Constant.NetworkErrorType.internetError
                            
                            Falioure(networkError)
                        }else if error._code == NSURLErrorNotConnectedToInternet{
                            networkError.status = Constant.NetworkErrorType.internet
                            networkError.message = Constant.NetworkErrorType.internetError
                            
                            Falioure(networkError)
                        }else if error._code == NSURLErrorCannotConnectToHost {
                            networkError.status = Constant.NetworkErrorType.serverErrorCode
                            networkError.message = Constant.NetworkErrorType.serverError
                            
                            Falioure(networkError)
                        }else if error._code == NSURLErrorSecureConnectionFailed{
                            networkError.status = Constant.NetworkErrorType.serverErrorCode
                            networkError.message = Constant.NetworkErrorType.serverError
                            
                            Falioure(networkError)
                            
                        }else{
                            
                            networkError.status = Constant.NetworkErrorType.generic
                            networkError.message = Constant.NetworkErrorType.genericError
                            
                            Falioure(networkError)
                        }
                        break
                        
                    }
                    
                })
            case .failure(let error):
                Falioure(error as! NetworkError)
            }
            
        })
        
        
    }
    
    
    
    
    
    class func UploadImage(url: String, parameters: Parameters?,userimg: UIImage,Progress: @escaping (Int) ->Void, Success: @escaping (Any?)->Void, Falioure: @escaping (NetworkError) -> Void)
    {
        var Headers : HTTPHeaders
        let Manger = Alamofire.SessionManager.default
        print(UserDefaults.standard.value(forKey: "userAuthToken")!)
        if let userToken = UserDefaults.standard.value(forKey: "userAuthToken") as? String {
            Headers = [
                "Accept": "application/json",
                "authorization" : userToken
                //"Content-type": "multipart/form-data"
            ]
        }else
        {
            Headers = ["Accept": "application/json"]
        }
        
        let type = "any"
        let fileName = "image"
        
        Manger.upload(multipartFormData: {(multipart) in
            
            if let data = userimg.jpegData(compressionQuality: 0.7)
            {
                print(data)
                multipart.append(data, withName: "image", fileName: fileName, mimeType: type)
            }
            //            for(key, values ) in parameters!
            //            {
            //                multipart.append((values as! String).data(using: String.Encoding.utf8)!, withName: key)
            //                print(values)
            //                print(values)
            //            }
            
        }, usingThreshold: UInt64.init(), to: url, method: .post, headers: Headers, encodingCompletion:{(result) in
            switch(result)
            {
            case .success(let request,_,_):
                request.uploadProgress(closure: { (prgrs) in
                    
                    let progress = Int(prgrs.fractionCompleted * 100)
                    print(progress)
                    Progress(progress)
                })
                request.responseJSON(completionHandler: {(successresponse)in
                    
                    switch(successresponse.result)
                    {
                    case .success:
                        let resultValue = successresponse.result.value
                        print(resultValue!)
                        Success(resultValue)
                        break
                        
                    case .failure (let error):
                        
                        
                        var networkError = NetworkError()
                        
                        if error._code == NSURLErrorTimedOut {
                            networkError.status = Constant.NetworkErrorType.timout
                            networkError.message = Constant.NetworkErrorType.timoutError
                            
                            Falioure(networkError)
                        } else if error._code == NSURLErrorNetworkConnectionLost {
                            networkError.status = Constant.NetworkErrorType.internet
                            networkError.message = Constant.NetworkErrorType.internetError
                            
                            Falioure(networkError)
                        }else if error._code == NSURLErrorNotConnectedToInternet{
                            networkError.status = Constant.NetworkErrorType.internet
                            networkError.message = Constant.NetworkErrorType.internetError
                            
                            Falioure(networkError)
                        }else if error._code == NSURLErrorCannotConnectToHost {
                            networkError.status = Constant.NetworkErrorType.serverErrorCode
                            networkError.message = Constant.NetworkErrorType.serverError
                            
                            Falioure(networkError)
                        }else if error._code == NSURLErrorSecureConnectionFailed{
                            networkError.status = Constant.NetworkErrorType.serverErrorCode
                            networkError.message = Constant.NetworkErrorType.serverError
                            
                            Falioure(networkError)
                            
                        }else{
                            
                            networkError.status = Constant.NetworkErrorType.generic
                            networkError.message = Constant.NetworkErrorType.genericError
                            
                            Falioure(networkError)
                        }
                        break
                        
                    }
                    
                })
            case .failure(let error):
                Falioure(error as! NetworkError)
            }
            
        })
    }
    
    
    
    
    
}
struct NetworkError {
    var status: Int = Constant.NetworkErrorType.generic
    var message: String = Constant.NetworkErrorType.genericError
}

struct NetworkSuccess {
    var status: Int = Constant.NetworkErrorType.generic
    var message: String = Constant.NetworkErrorType.genericError
}
