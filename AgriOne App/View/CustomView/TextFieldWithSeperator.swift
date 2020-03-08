//
//  TextFieldWithSeperator.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/16/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities

class TextFleidWithSeperator: MNkView {
    var textFeild:UITextField!
    var seperateView:UIView!
    
    
    override func config(){
        backgroundColor = .clear
    }
    
    override func createViews(){
        textFeild = UITextField()
        textFeild.textColor = AppColor.black
        textFeild.delegate = self
        textFeild.translatesAutoresizingMaskIntoConstraints = false
        
        seperateView = UIView()
        seperateView.backgroundColor = AppColor.black
        seperateView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override func insertAndLayoutSubviews() {
        
        addSubview(textFeild)
        addSubview(seperateView)
        
        NSLayoutConstraint.activate([textFeild.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                                     textFeild.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
                                     textFeild.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                                     textFeild.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
                                     ])
        
        NSLayoutConstraint.activate([seperateView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
                                     seperateView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                                     seperateView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                                     seperateView.heightAnchor.constraint(equalToConstant: 1)
                                    ])
    }
}

extension TextFleidWithSeperator:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.superview?.endEditing(true)
        return false
    }
}
