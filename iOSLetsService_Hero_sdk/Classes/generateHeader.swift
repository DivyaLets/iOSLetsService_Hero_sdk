//
//  generateHeader.swift
//  divyaaa
//
//  Created by Ats on 10/08/19.
//  Copyright © 2019 Ats. All rights reserved.
//

import Foundation

public class Utils{
   public static func getUrlToken(key : String) -> String {
        var hash : Double = 0
        let str = key+"LetsServiceAPIs"
        for char in str{
            let temp = Double((hash * 8)-hash)
            hash = temp + Double(char.ascii!)
            print(hash)
        }
        return String(UInt(hash))
    }
    
    public static func generateHeaderToken(keyA: String,  keyB : String ) -> String {
        var hash : Double = 0
        let str = keyA+keyB
        for char in str{
            let temp = Double((hash * 8)-hash)
            hash = temp + Double(char.ascii!)
            print(hash)
        }
        return String(UInt(hash))
    }
    
}

extension StringProtocol {
    var ascii: [UInt32] {
        return unicodeScalars.compactMap { $0.isASCII ? $0.value : nil }
    }
}
extension Character {
    var ascii: UInt32? {
        return String(self).ascii.first
    }
}


