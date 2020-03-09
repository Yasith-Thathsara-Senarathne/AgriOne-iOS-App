//
//  AverageView.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/24/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities
import  Charts

class AverageView:MNkView {
    var dateLabel:UILabel!
    var circleProgessView:CircleProgressView!
    private var mainSV:UIStackView!
    private var dateTextLabel:UILabel!
    var percentageLabel:UILabel!
    private var containerView:UIView!
    
    override func config() {
        backgroundColor = AppColor.white
        activeShadow(using: AppColor.slateGray)
    }
    
    override func createViews() {
        containerView = UIView()
        containerView.backgroundColor = AppColor.white
        
        dateLabel = UILabel()
        dateLabel.textAlignment = .left
        dateLabel.text = "2020-02-24"
        dateLabel.textColor = AppColor.black
        dateLabel.font = AppFont.font(with: .bold, size: 15)
        
        circleProgessView = CircleProgressView()
        
        dateTextLabel = UILabel()
        dateTextLabel.textAlignment = .left
        dateTextLabel.textColor = AppColor.slateGray
        dateTextLabel.text = "Date"
        dateTextLabel.font = AppFont.font(with: .bold, size: 15)
        
        percentageLabel = UILabel()
        percentageLabel.textAlignment = .left
        percentageLabel.textColor = AppColor.slateGray
        percentageLabel.text = "75 %"
        percentageLabel.font = AppFont.font(with: .bold, size: 15)
        
        let firstSV = UIStackView.init(arrangedSubviews: [dateTextLabel, dateLabel])
        firstSV.axis = .horizontal
        firstSV.distribution = .fillEqually
        
        let secondtSV = UIStackView.init(arrangedSubviews: [percentageLabel, circleProgessView])
        secondtSV.axis = .horizontal
        secondtSV.distribution = .fillEqually
        secondtSV.spacing = 100
        
        mainSV = UIStackView.init(arrangedSubviews: [firstSV, secondtSV])
        mainSV.axis = .vertical
        mainSV.distribution = .fillEqually
        mainSV.spacing = 50
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(containerView)
        
        containerView.activateLayouts(to: self, [.top:10,.leading:30,.traling:-30,.bottom:-10])
        
        containerView.addSubview(mainSV)
        
        mainSV.activateLayouts(to: containerView, [.centerY:0,.top:10,.bottom:-10,.leading:10,.traling:-10])
    }
}
