//
//  AppFont.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/16/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import Foundation
import UIKit

struct AppFont{
    static func font(with name:FontName = .regular,size:CGFloat)->UIFont{
        return UIFont(name: name.rawValue, size: size) ?? UIFont.init()
    }
    enum FontName:String{
        case regular = "Roboto-Regular"
        case light = "Roboto-Light"
        case medium = "Roboto-Medium"
        case bold = "Roboto-Bold"
        case black = "Roboto-Black"
        case thin = "Roboto-Thin"
    }
}
