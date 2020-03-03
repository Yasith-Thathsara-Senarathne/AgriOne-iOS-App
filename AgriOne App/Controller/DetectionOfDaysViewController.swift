//
//  DetectionOfDaysViewController.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/16/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities

class DetectionOfDaysViewController:MNkTableViewController_Parameter_CellType<Dod,DODaysTVCell>{
    private var datePickerView:DatePickerView!
    
    private var topHeight:CGFloat{
        return navigationController!.navigationBar.frame.height - 25
    }
    
    override func config() {
        super.config()
        title = "Detection Of Days"
        
        tableview.contentInset.top = topHeight + 10
        tableview.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func createViews() {
        super.createViews()
        
        datePickerView = DatePickerView()
        datePickerView.delegate = self
    
    }
    
    override func insertAndLayoutSubviews() {
        super.insertAndLayoutSubviews()
        view.addSubview(datePickerView)
        
        datePickerView.activateLayouts(to: view, [.top:10,.leading:5,.traling:-5], true)
    }
    
    override func updateUIWithNewData() {
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetectionOfDesieaseViewController(), animated: true)
    }
}

extension DetectionOfDaysViewController:DatePickerDelegate{
    func searchButtonTapped() {
        data = getDodList()
    }
}
