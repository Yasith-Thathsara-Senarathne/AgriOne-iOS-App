//
//  DetectionOfDaysViewController.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/16/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities
import FirebaseDatabase

class DetectionOfDaysViewController:MNkViewController {
    private var tableView:UITableView!
    private var datePickerView:DatePickerView!
    
    private var ref:DatabaseReference! = Database.database().reference()
    
    private var doDList:[DODesiease]! = [] {
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
        let detectionOfDesieaseVC = DetectionOfDesieaseViewController()
        detectionOfDesieaseVC.doDesiease = doDList[indexPath.item]
        self.navigationController?.pushViewController(detectionOfDesieaseVC, animated: true)
    }
}

extension DetectionOfDaysViewController {
    private func initializeDbReference(){
        ref = nil
        if ref == nil{
            ref = Database.database().reference()
        }
    }
    
    private func getDODaysData(params:(fromDate:String,toDate:String)) {
        initializeDbReference()
        let dodaysRef = ref.child("DODays")
        
        doDList = []
        
        dodaysRef.queryOrdered(byChild: "date").queryStarting(atValue: params.fromDate).queryEnding(atValue: params.toDate).observe(.value, with: { (snapshot) in
            
            if snapshot.childrenCount > 0 {
                let childs = snapshot.children
                while let child = childs.nextObject() as? DataSnapshot {
                    let childValues = child.value as! [String:AnyObject]
                    
                    let average = childValues["average"] as! Double
                    let date = childValues["date"] as! String
                    let images = childValues["images"] as! [String:[String:AnyObject]]
                    
                    var desiease:[Desiease] = []
                    
                    let imageList = images.values
                    if imageList.count > 0 {
                        for image in imageList {
                            let imageURL = image["image"] as! String
                            let precentage = image["percentage"] as! Double
                            
                            desiease.append(Desiease.init(image: imageURL, precentage: precentage))
                        }
                    }
                    self.doDList.append(DODesiease.init(date: date, averagePrecentage: average, desieaseList: desiease))
                }
            }
            
        }) { (error) in
            print("Error: ",error.localizedDescription)
        }
    }
}

extension DetectionOfDaysViewController:DatePickerDelegate{
    func searchButtonTapped() {
//        doDList = getDodList()
        guard let fromDate = datePickerView.fromDatePicker.textDatePicker.text,
            let toDate = datePickerView.toDatePicker.textDatePicker.text else {
                return
        }
        
        getDODaysData(params: (fromDate, toDate))
    }
}

extension DetectionOfDaysViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doDList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DODaysTVCell
        cell.date = doDList[indexPath.item].date
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return datePickerView
    }
    
}
