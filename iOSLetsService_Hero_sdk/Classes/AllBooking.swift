//
//  AllBooking.swift
//  iOS_LetsService_Hero_sdk
//
//  Created by Ats on 12/08/19.
//

import Foundation
import ObjectMapper

class Booking : Mappable  {
    
    var status: String?
    var _id: Int?
    var userId: Int?
    var userName: String?
    var useremail: String?
    var user_mobile: String?
    var bikeBrandname: String?
    var createdBy_Id: Int?
    var organicId: Int?
    var pcId: Int?
    var bikeBrand: Int?
    var bikeModel: String?
    var bikeNo: String?
    var pickAddress: String?
    var dropAddress: String?
    var locality: String?
    var dateTime: String?
    var serviceTypeId: Int?
    var assistanceTypeId: Int?
    var assistanceType: String?
    var serviceCenter: String?
    var typeOfService: String?
    var ACRId: Int?
    var cancelRemarks: String?
    var scStatus: String?
    var final_quotation: Int?
    var discounted_amount: Int?
    var assistanceAmount: Int?
    var lsAmount: Int?
    var chassisNo : String?
    var engineNO: String?
    var SPONO: String?
    var dealerCode: String?
    var availHMSICredit: Int?
    var typeOfPD: String?
    var amcUser: String?
    var privilegeId: Int?
    var cityId: Int?
    var couponId: Int?
    var teleCallerTCID : Int?
    var CREID: Int?
    var activeStatus: String?
    var rating: String?
    var runnerId: Int?
    var runnername: String?
    var runnerPicture: String?
    var runnermobile: Int?
    var paymentStatus: String?
    var serviceCenterLat: String?
    var serviceCenterLon: String?
    var create_ts: String?
    var update_ts: String?
    var feedbackStatu: String?
    var bookingNo: String?
    
    required init?(map: Map){
        
         status = ""
         _id = 0
         userId = 0
         userName = ""
         useremail = ""
         user_mobile = ""
         bikeBrandname = ""
         createdBy_Id = 0
         organicId = 0
         pcId = 0
         bikeBrand = 0
         bikeModel = ""
         bikeNo = ""
         pickAddress = ""
         dropAddress = ""
         locality = ""
         dateTime = ""
         serviceTypeId = 0
         assistanceTypeId = 0
         assistanceType = ""
         serviceCenter = ""
         typeOfService = ""
         ACRId = 0
         cancelRemarks = ""
         scStatus = ""
         final_quotation = 0
         discounted_amount = 0
         assistanceAmount = 0
         lsAmount = 0
        chassisNo = ""
         engineNO = ""
         SPONO = ""
         dealerCode = ""
         availHMSICredit = 0
         typeOfPD = ""
         amcUser = ""
         privilegeId = 0
         cityId = 0
         couponId = 0
         teleCallerTCID = 0
         CREID = 0
         activeStatus = ""
         rating = ""
         runnerId = 0
         runnername = ""
         runnerPicture = ""
         runnermobile = 0
         paymentStatus = ""
         serviceCenterLat = ""
         serviceCenterLon = ""
         create_ts = ""
         update_ts = ""
         feedbackStatu = ""
         bookingNo = ""
        
    }
    
    init() {
        status = ""
        _id = 0
        userId = 0
        userName = ""
        useremail = ""
        user_mobile = ""
        bikeBrandname = ""
        createdBy_Id = 0
        organicId = 0
        pcId = 0
        bikeBrand = 0
        bikeModel = ""
        bikeNo = ""
        pickAddress = ""
        dropAddress = ""
        locality = ""
        dateTime = ""
        serviceTypeId = 0
        assistanceTypeId = 0
        assistanceType = ""
        serviceCenter = ""
        typeOfService = ""
        ACRId = 0
        cancelRemarks = ""
        scStatus = ""
        final_quotation = 0
        discounted_amount = 0
        assistanceAmount = 0
        lsAmount = 0
        chassisNo = ""
        engineNO = ""
        SPONO = ""
        dealerCode = ""
        availHMSICredit = 0
        typeOfPD = ""
        amcUser = ""
        privilegeId = 0
        cityId = 0
        couponId = 0
        teleCallerTCID = 0
        CREID = 0
        activeStatus = ""
        rating = ""
        runnerId = 0
        runnername = ""
        runnerPicture = ""
        runnermobile = 0
        paymentStatus = ""
        serviceCenterLat = ""
        serviceCenterLon = ""
        create_ts = ""
        update_ts = ""
        feedbackStatu = ""
        bookingNo = ""
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        _id <- map["_id"]
        userId <- map["userId"]
        userName <- map["userName"]
        useremail <- map["useremail"]
        user_mobile <- map["user_mobile"]
        bikeBrandname <- map["bikeBrandname"]
        createdBy_Id <- map["createdBy_Id"]
        organicId <- map["organicId"]
        pcId <- map["pcId"]
        bikeBrand <- map["bikeBrand"]
        bikeModel <- map["bikeModel"]
        bikeNo <- map["bikeNo"]
        pickAddress <- map["pickAddress"]
        dropAddress <- map["dropAddress"]
        locality <- map["locality"]
        dateTime <- map["dateTime"]
        serviceTypeId <- map["serviceTypeId"]
        assistanceTypeId <- map["assistanceTypeId"]
        assistanceType <- map["assistanceType"]
        serviceCenter <- map["serviceCenter"]
        typeOfService <- map["typeOfService"]
        ACRId <- map["ACRId"]
        cancelRemarks <- map["cancelRemarks"]
        scStatus <- map["scStatus"]
        final_quotation <- map["final_quotation"]
        discounted_amount <- map["discounted_amount"]
        assistanceAmount <- map["assistanceAmount"]
        lsAmount <- map["lsAmount"]
        chassisNo <- map["chassisNo"]
        engineNO <- map["engineNO"]
        SPONO <- map["SPONO"]
        dealerCode <- map["dealerCode"]
        availHMSICredit <- map["availHMSICredit"]
        typeOfPD <- map["typeOfPD"]
        amcUser <- map["amcUser"]
        privilegeId <- map["privilegeId"]
        cityId <- map["cityId"]
        couponId <- map["couponId"]
        teleCallerTCID <- map["teleCallerTCID"]
        CREID <- map["CREID"]
        activeStatus <- map["activeStatus"]
        rating <- map["rating"]
        runnerId <- map["runnerId"]
        runnername <- map[runnername!]
        runnerPicture <- map["runnerPicture"]
        runnermobile <- map["runnermobile"]
        paymentStatus <- map["paymentStatus"]
        serviceCenterLat <- map["serviceCenterLat"]
        serviceCenterLon <- map["serviceCenterLon"]
        create_ts <- map["create_ts"]
        update_ts <- map["update_ts"]
        feedbackStatu <- map["feedbackStatu"]
        bookingNo <- map["bookingNo"]
    }
    
}
