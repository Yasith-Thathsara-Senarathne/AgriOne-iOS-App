//
//  Extenstion.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/16/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit

extension UINavigationItem{
    
    public func isBackButtonTitleHidden(with isHidden:Bool){
        if isHidden{
            self.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
    
}
