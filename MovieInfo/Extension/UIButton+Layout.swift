//
//  UIButton+Layout.swift
//  MovieInfo
//
//  Created by parul vats on 22/01/2018.
//  Copyright © 2018 parul vats. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func addShadow() {
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.5
    }
    
    func makeButtonRound(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
