//
//  AccountView.swift
//  AgriOne App
//
//  Created by iOS_Dev_01 on 3/4/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities

class AccountView:MNkView {
    private var iconIV:UIImageView!
    private var userNameLabel:UILabel!
    private var logoutButton:UIButton!
    private var mainSV:UIStackView!
    
    override func config() {
        backgroundColor = AppColor.white
        activeShadow(using: AppColor.black)
    }
    
    override func createViews() {
        iconIV = UIImageView.init(image: #imageLiteral(resourceName: "user").withRenderingMode(.alwaysTemplate))
        iconIV.tintColor = AppColor.riverBed
        iconIV.clipsToBounds = true
        iconIV.contentMode = .scaleAspectFit
        
        userNameLabel = UILabel()
        userNameLabel.textAlignment = .center
        userNameLabel.textColor = AppColor.slateGray
        userNameLabel.font = AppFont.font(with: .bold, size: 20)
        userNameLabel.text = "Admin"
        
        logoutButton = UIButton()
        logoutButton.backgroundColor = AppColor.pictonBlue
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.titleEdgeInsets = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        
        mainSV = UIStackView.init(arrangedSubviews: [iconIV,userNameLabel,logoutButton])
        mainSV.axis = .vertical
        mainSV.spacing = 6
        mainSV.distribution = .fillProportionally
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(mainSV)
        
        mainSV.activateLayouts(to: self, [.top:0,.bottom:-10,.leading:5,.traling:-5])
        
        logoutButton.activateLayouts([.height:35])
        
        iconIV.activateLayouts([.width:60,.height:60])
    }
}
