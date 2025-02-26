//
//  DodTVCell.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/17/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities

class DODaysTVCell:MNkTableViewCell {
    private var dateLabel:UILabel!
    
    private var cellHeight:CGFloat{
        return 40
    }
    
    var date:String! {
        didSet {
            updateUIWithData()
        }
    }
    
    override func config() {
        activeShadow(using: AppColor.slateGray)
        layer.cornerRadius = 5
        accessoryType = .disclosureIndicator
        selectionStyle = .none
    }
    
    override func createViews() {
        dateLabel = UILabel()
        dateLabel.textColor = AppColor.riverBed
        dateLabel.font = AppFont.font(with: .medium, size: 20)
        
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(dateLabel)
        
        dateLabel.activateLayouts(to: self, [.top:20,.bottom:-20,.leading:10,.traling:-10,.centerY:0])
    }
    
    private func updateUIWithData() {
        dateLabel.text = date
    }
}
