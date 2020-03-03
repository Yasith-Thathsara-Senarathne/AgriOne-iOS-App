//
//  ButtonWithImage.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/16/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities

class ButtonWithImage:MNkView{
    private var stackView:UIStackView!
    var button:UIButton!
    var imageView:UIImageView!
    
    override func config() {
        backgroundColor = AppColor.white
    }
    
    override func createViews() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

        button = UIButton()
        
        stackView = UIStackView.init(arrangedSubviews: [imageView, button])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(stackView)
        
        stackView.activateLayouts(equalConstant: 10, to: self)
        
        imageView.activateLayouts([.height:50])
        button.activateLayouts([.height:50])
    }
    
}
