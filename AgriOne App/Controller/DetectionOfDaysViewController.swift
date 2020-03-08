//
//  DetectionOfDaysViewController.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/16/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities

class DetectionOfDaysViewController:MNkViewController {
    private var tableView:UITableView!
    private var datePickerView:DatePickerView!
    
    private var doDList:[Dod]! = [] {
        didSet {
            updateUIWithNewData()
        }
    }
    
    private var cellID:String {
        return "tv_cellid"
    }
    
    override func config() {
        super.config()
        title = "Detection Of Days"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func createViews() {
        super.createViews()
        
        tableView = UITableView.init(frame: view.frame, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = AppColor.white
        tableView.register(DODaysTVCell.self, forCellReuseIdentifier: cellID)
        
        datePickerView = DatePickerView()
        datePickerView.delegate = self
    
    }
    
    override func insertAndLayoutSubviews() {
        super.insertAndLayoutSubviews()
        view.addSubview(tableView)
    }
    
    override func updateUIWithNewData() {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetectionOfDesieaseViewController(), animated: true)
    }
}

extension DetectionOfDaysViewController:DatePickerDelegate{
    func searchButtonTapped() {
        doDList = getDodList()
    }
}

extension DetectionOfDaysViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doDList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DODaysTVCell
        cell.data = doDList[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return datePickerView
    }
    
}
