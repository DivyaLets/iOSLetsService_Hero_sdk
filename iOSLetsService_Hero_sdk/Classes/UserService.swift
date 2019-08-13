//
//  UserService.swift
//  ZenDriveDemoProduct
//
//  Created by Ats on 08/04/19.
//  Copyright © 2019 Ats. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import ObjectMapper
import AlamofireObjectMapper

public class UserService:APIService {
    
    var services = APIService()
    
    // MARK:- ------  API Calls --------------

       func allBooking(target:UIViewController? = nil,complition:@escaping ([AllBookingList]?) ->Void) {
        // target?.showLoader()
        
        let allBookingUserURL = Config.baseUrl+Config.BookingsUrl + "/" + "MBLJFW12J4F12239" + "/5/"+Utils.getUrlToken(key: "5")
        print(allBookingUserURL)
        
        let headerToken = ["Header-Token" : Utils.generateHeaderToken(keyA: "5", keyB: "LsSalesHeader")]
        print(headerToken)
        
        Alamofire.request(allBookingUserURL, method: .get, encoding: JSONEncoding.default,headers: headerToken).responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case.success(let data):
                print("success",data)
                if data is [String: Any] {
                    complition(nil)
                } else if data is [String] {
                    
                    complition(nil)
                } else {
                    let userApptBookingList = Mapper<AllBookingList>().mapArray(JSONArray: data as! [[String: Any]])
                    complition(userApptBookingList)
                    
                }
            case.failure(let error):
                print("Not Success",error)
                complition(nil)
            }
            //target?.hideLoader()
        }
    }
}
