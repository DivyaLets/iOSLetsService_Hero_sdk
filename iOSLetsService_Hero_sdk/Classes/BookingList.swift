//
//  BookingList.swift
//  Alamofire
//
//  Created by Ats on 12/08/19.
//

import Foundation
import ObjectMapper


class AllBookingList : Mappable {
    
    var success  :  String?
    var message    :  String?
    var appointmentDetails  :  [Booking]?
    
    required init?(map: Map){
        success   = ""
        message = ""
        appointmentDetails = []
    }
    
    init() {
        success   = ""
        message = ""
        appointmentDetails = []
    }
    
    func mapping(map: Map) {
         success <- map["success"]
         message <- map["message"]
         appointmentDetails <- map["appointmentDetails"]
    }
}

