//
//  ApiServices.swift
//  ZenDriveDemoProduct
//
//  Created by Ats on 08/04/19.
//  Copyright © 2019 Ats. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

public enum Method: Int {
    case post,get,put,delete
}

extension Method {
    
    var name:String {
        switch self {
        case .post:
            return "POST"
        case .get:
            return "GET"
        case .put:
            return "PUT"
        default:
            return "DELETE"
        }
    }
}

extension String {
    var nsdata: Data {
        return self.data(using: String.Encoding.utf8)!
    }
}

struct File {
    let name: String!
    let url: URL!
    init(name: String, url: URL) {
        self.name = name
        self.url = url
    }
}

enum Result <T>{
    case Success(NSDictionary)
    case Error(String)
}



public class APIService: NSObject {
    var Result = NSDictionary()
    func startService(with method:Method,path:String,parameters:Data,files:Array<File>?, completion: @escaping (Result<Any>) -> Void) {
        guard let url = URL(string:Config.baseUrl+path) else { return completion(.Error("Invalid URL, we can't proceed.")) }
        let request = self.buildRequest(with: method, url: url, parameters: parameters, files: files)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else { return completion(.Error(error!.localizedDescription)) }
            guard let data = data else { return completion(.Error(error?.localizedDescription ?? "Data not found."))
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? Dictionary<String,AnyObject> {
                    DispatchQueue.main.async {
                        completion(.Success(json as NSDictionary))
                    }
                }
            } catch let error {
                return completion(.Error(error.localizedDescription))
            }
        }
        
        task.resume()
    }
    
    
    
    //For multipart request
    func postRequestWithMultipartData(urlString: String, methodType:String, postParameter:AnyObject,mediaData:AnyObject?,mediaName:String,mediaMIME:String,mediaRequestKey:String, success: @escaping (_ receivedResponse: AnyObject, _ receivedMessage:String) -> Void, failure: @escaping (_ receivedResponse: AnyObject, _ failureMessage:String, _ failureCode:NSInteger, _ error: NSError?) -> Void){
        
        let dataDict:NSMutableDictionary = NSMutableDictionary()
        //UIApplication.shared.beginIgnoringInteractionEvents()
        
        // Setup the session to make REST POST call
        let postEndpoint: String = Config.baseUrl+urlString
        let url = NSURL(string: postEndpoint)!
        /*  let sessionConfiguration = URLSessionConfiguration.default
         var session = URLSession.shared*/
        // session = URLSession(configuration: sessionConfiguration)
        /* dataDict.setValue(postEndpoint, forKey: urlLocalKey)
         dataDict.setValue(NSDate().getStringFromDate(), forKey: dateLocalKey)*/
        
        // Create the request
        var request = URLRequest(url: url as URL)
        
        request.httpMethod = methodType
        request.timeoutInterval  = 120
        let body = NSMutableData()
        let boundary = generateBoundaryString()
        //request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        print("Token:\(23)")
        
        //        if UserDefaults.getAPIAccessToken().characters.count > 0 {
        //
        //            request.setValue(UserDefaults.getAPIAccessToken(), forHTTPHeaderField: "Authorization")
        //
        //        }
        
        /*   if UserDefaults.getUserToken().characters.count > 0 {
         request.setValue("bearer \(NSUserDefaults.getUserToken())", forHTTPHeaderField: "authorization")
         }
         
         */
        // request.setValue("bearer \(mediaName)", forHTTPHeaderField: "authorization")
        
        
        
        do {
            if(postParameter is NSDictionary){
                let requestDictionary: NSDictionary = postParameter as! NSDictionary
                print("url\(url)")
                
                for (key, value) in requestDictionary {
                    
                    body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                    
                    body.append("Content-Disposition:form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                    body.append("\(value)\r\n".data(using: String.Encoding.utf8)!)
                }
                
                if mediaData != nil {
                    if(mediaData is NSString){
                        
                        let mediaDataString: String = mediaData as! String
                        
                        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                        body.append("Content-Disposition:form-data; name=\"\(mediaRequestKey)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                        body.append("\(mediaDataString)\r\n".data(using: String.Encoding.utf8)!)
                        
                        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
                    }else{
                        
                        let mediaDataValue: NSData = mediaData as! NSData
                        
                        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                        body.append("Content-Disposition:form-data; name=\"test\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                        body.append("hi\r\n".data(using: String.Encoding.utf8)!)
                        
                        
                        
                        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                        body.append("Content-Disposition:form-data; name=\"\(mediaRequestKey)\"; filename=\"\(mediaName)\"\r\n".data(using: String.Encoding.utf8)!)
                        body.append("Content-Type: \(mediaMIME)\r\n\r\n".data(using: String.Encoding.utf8)!)
                        body.append(mediaDataValue as Data)
                        body.append("\r\n".data(using: String.Encoding.utf8)!)
                        
                        
                        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
                    }
                }
                
                request.httpBody = body as Data
                
            }
        }
        // Make the POST call and handle it in a completion handler
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            print("response: \(response)")
            
            if((error == nil)){
                print("response: \(response)")
                
                guard let realResponse = response as? HTTPURLResponse,
                    realResponse.statusCode == 200 else {
                        
                        DispatchQueue.main.async(execute: { () -> Void in
                            
                            //  let errorInResponse = response as? HTTPURLResponse
                            
                            // let (title, message) = error. //getErrorDetails(errorInResponse!.statusCode)
                            
                            /* AlertView.showRootAlertWithCompletion(title, message: message, completion: {
                             })
                             */
                        })
                        //UIApplication.shared.endIgnoringInteractionEvents()
                        dataDict.setValue(response, forKey: "data")
                        failure("" as AnyObject, "Not 200 Response Code", 0, nil)
                        print("Not 200 Response Code")
                        return
                }
                // Read the JSON
                if let postString = NSString(data:data!, encoding: String.Encoding.utf8.rawValue) as? String {
                    // Print what we got from the call
                    
                    let jsonDictionary: NSDictionary!=(try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
                    print("POST: " + postString)
                    if (jsonDictionary.value(forKey: "code") as! NSNumber == 200){
                        
                        let receivedSuccessMessage:String = jsonDictionary.value(forKey: "msg") as! String
                        
                        
                        dataDict.setValue(postString, forKey: "Data")
                        
                        UIApplication.shared.endIgnoringInteractionEvents()
                        
                        
                        success(jsonDictionary, receivedSuccessMessage)
                    }else if jsonDictionary.value(forKey: "code") as! NSNumber == 201 {
                        // UIApplication.shared.endIgnoringInteractionEvents()
                        
                        let receivedMessage:String = jsonDictionary.value(forKey: "msg") as! String
                        
                        failure(jsonDictionary, receivedMessage, 0, error as NSError?)
                    }
                    else if jsonDictionary.value(forKey: "code") as! NSNumber == 401 {
                        
                        // UIApplication.shared.endIgnoringInteractionEvents()
                        DispatchQueue.main.async(execute: { () -> Void in
                            
                            let errorInResponse = response as? HTTPURLResponse
                            
                            // let (title, message) = error. //getErrorDetails(errorInResponse!.statusCode)
                            
                            /* AlertView.showRootAlertWithCompletion(title, message: message, completion: {
                             })
                             */
                        })
                        
                    }else if jsonDictionary.value(forKey: "code") as! NSNumber == 402 {
                        
                        // UIApplication.shared.endIgnoringInteractionEvents()
                        DispatchQueue.main.async(execute: { () -> Void in
                            
                            //let errorInResponse = response as? HTTPURLResponse
                            let receivedMessage:String = jsonDictionary.value(forKey: "message") as! String
                            failure(jsonDictionary, receivedMessage, 0, error as NSError?)
                        })
                        
                    }else {
                        failure(jsonDictionary, "", 0, error as NSError?)
                    }
                    
                }
            }else{
                
                //  UIApplication.shared.endIgnoringInteractionEvents()
                DispatchQueue.main.async(execute: { () -> Void in
                    // let (title, message) = error. //getErrorDetails(errorInResponse!.statusCode)
                    
                    /* AlertView.showRootAlertWithCompletion(title, message: message, completion: {
                     })
                     */
                })
            }
        }
        
        task.resume()
    }
    
    //To generate boundary for multipart function
    func generateBoundaryString() -> String
    {
        return "Boundary-\(NSUUID().uuidString)"
    }
}

extension APIService {
    
    func buildRequest(with method:Method,url:URL,parameters:Data,files:Array<File>?) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.name
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = parameters
        return request
    }
    
    func buildParams(parameters: Dictionary<String,Any>) -> String {
        var components: [(String, String)] = []
        for (key,value) in parameters {
            components += self.queryComponents(key, value)
        }
        return (components.map{"\($0)=\($1)"} as [String]).joined(separator: "&")
    }
    func queryComponents(_ key: String, _ value: Any) -> [(String, String)] {
        var components: [(String, String)] = []
        if let dictionary = value as? Dictionary<String,Any> {
            for (nestedKey, value) in dictionary {
                components += queryComponents("\(key)[\(nestedKey)]", value)
            }
        } else if let array = value as? [AnyObject] {
            for value in array {
                components += queryComponents("\(key)", value)
            }
        } else {
            components.append(contentsOf: [(escape(string: key), escape(string: "\(value)"))])
        }
        
        return components
    }
    func escape(string: String) -> String {
        if let encodedString = string.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed) {
            return encodedString
        }
        return ""
    }
}
