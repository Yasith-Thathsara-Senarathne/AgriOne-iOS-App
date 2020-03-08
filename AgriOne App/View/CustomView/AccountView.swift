//
//  AccountView.swift
//  AgriOne App
//
//  Created by iOS_Dev_01 on 3/4/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities

protocol AccountDelegate:class {
    func userTappedLogoutButton()
}

class AccountView:MNkView {
    private var containerView:UIView!
    private var iconIV:UIImageView!
    private var userNameLabel:UILabel!
    private var logoutButton:UIButton!
    private var mainSV:UIStackView!
    
    var delegate:AccountDelegate?
    
    override func config() {
        backgroundColor = AppColor.black.withAlphaComponent(0.7)
        activeShadow(using: AppColor.white)
    }
    
    override func createViews() {
        iconIV = UIImageView.init(image: #imageLiteral(resourceName: "user").withRenderingMode(.alwaysTemplate))
        iconIV.tintColor = AppColor.white
        iconIV.clipsToBounds = true
        iconIV.contentMode = .scaleAspectFit
        
        userNameLabel = UILabel()
        userNameLabel.textAlignment = .center
        userNameLabel.textColor = AppColor.white
        userNameLabel.font = AppFont.font(with: .bold, size: 17)
        userNameLabel.text = "Admin"
        
        logoutButton = UIButton()
        logoutButton.backgroundColor = AppColor.pictonBlue
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.titleEdgeInsets = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        logoutButton.addTarget(self, action: #selector(userTappedLogoutBtn), for: .touchUpInside)
        
        mainSV = UIStackView.init(arrangedSubviews: [iconIV,userNameLabel,logoutButton])
        mainSV.axis = .vertical
        mainSV.spacing = 4
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(mainSV)
        
        mainSV.activateLayouts(to: self, [.top:10,.bottom:-10,.leading:5,.traling:-5])
        
        logoutButton.activateLayouts([.height:30])
        
        iconIV.activateLayouts([.height:40])
    }
    @objc private func userTappedLogoutBtn() {
        delegate?.userTappedLogoutButton()
    }
}
