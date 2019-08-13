//
//  Reachability.swift
//  ZenDriveDemoProduct
//
//  Created by Ats on 08/04/19.
//  Copyright © 2019 Ats. All rights reserved.
//

import SystemConfiguration
import Foundation
import Alamofire

public class Reachability {
    
  public class func isConnectedToNetwork() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
