//
//  CurevedView.swift
//  Alamofire
//
//  Created by Ats on 12/08/19.
//

import Foundation
import UIKit

extension UIView {
    
func curvedView(corner: CGFloat) {
    self.layer.masksToBounds = true
    self.layer.cornerRadius = corner
  }

}
