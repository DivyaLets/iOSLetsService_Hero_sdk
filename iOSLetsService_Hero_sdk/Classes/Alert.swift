//
//  Alert.swift
//  divyaaa
//
//  Created by Ats on 10/08/19.
//  Copyright © 2019 Ats. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    public func showAlert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)

    }
    
}
