//
//  DatePickerTextView.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/17/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities

class DataPickerTextView:MNkView{
    
    var textDatePicker:UITextField!
    var datePicker:UIDatePicker!
    
    override func config() {
        backgroundColor = .clear
        
        layer.borderWidth = 1
        layer.borderColor = AppColor.black.cgColor
        
        layer.cornerRadius = 4
        
        showDatePicker()
    }
    
    override func createViews() {
        textDatePicker = UITextField()
        textDatePicker.placeholder = "Date"
        textDatePicker.textAlignment = .center
        
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(textDatePicker)
        
        textDatePicker.activateLayouts(to: self)
    }
    
    func showDatePicker(){
       //Formate Date
       datePicker.datePickerMode = .date

      //ToolBar
      let toolbar = UIToolbar();
      toolbar.sizeToFit()
      let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
     let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

    toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

     textDatePicker.inputAccessoryView = toolbar
     textDatePicker.inputView = datePicker

    }

     @objc func donedatePicker(){

      let formatter = DateFormatter()
      formatter.dateFormat = "dd/MM/yyyy"
      textDatePicker.text = formatter.string(from: datePicker.date)
      self.endEditing(true)
    }

    @objc func cancelDatePicker(){
       self.endEditing(true)
     }
}
