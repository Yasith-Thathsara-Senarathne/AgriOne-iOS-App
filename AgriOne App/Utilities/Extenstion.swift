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

extension UIView {
    func toImage(fetched:@escaping(_ image:UIImage?)->()) {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)

        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            fetched(UIImage())
            return
        }
        UIGraphicsEndImageContext()
        fetched(image)
    }
}

extension String {
    func toDateFormat(withFormat format: String = "yyyy-MM-dd") -> String {
        let dateToFormat = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: dateToFormat) else {
            print("Date formatting error")
            return "Error with the date"
        }
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
