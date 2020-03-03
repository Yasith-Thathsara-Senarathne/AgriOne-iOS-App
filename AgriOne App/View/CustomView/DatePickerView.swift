//
//  DatePickerView.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/17/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities

protocol DatePickerDelegate:class {
    func searchButtonTapped()
}

class DatePickerView:MNkView{
    private var stackView:UIStackView!
    private var fromDatePicker:DataPickerTextView!
    private var toDatePicker:DataPickerTextView!
    var searchButton:UIButton!
    
    var delegate:DatePickerDelegate?
    
    override func config() {
        backgroundColor = AppColor.white
        activeShadow(using: AppColor.slateGray)
    }
    
    override func createViews() {
        fromDatePicker = DataPickerTextView()
        fromDatePicker.textDatePicker.placeholder = "From Date"
        
        toDatePicker = DataPickerTextView()
        toDatePicker.textDatePicker.placeholder = "To Date"
        
        searchButton = UIButton()
        searchButton.setTitle("Search", for: .normal)
        searchButton.setTitleColor(AppColor.white, for: .normal)
        searchButton.titleEdgeInsets = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        searchButton.backgroundColor = AppColor.pictonBlue
        searchButton.layer.cornerRadius = 4
        searchButton.addTarget(self, action: #selector(userTappedSearchButton), for: .touchUpInside)
        
        stackView = UIStackView.init(arrangedSubviews: [fromDatePicker, toDatePicker, searchButton])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(stackView)
        
        stackView.activateLayouts(equalConstant: 5, to: self)
    }
    
    @objc func userTappedSearchButton(){
        delegate?.searchButtonTapped()
    }
}
