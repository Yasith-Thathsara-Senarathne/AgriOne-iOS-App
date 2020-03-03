//
//  DetectionOfDesieaseViewController.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/24/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities
import Charts

class DetectionOfDesieaseViewController:MNkViewController {
    private var tableView:UITableView!
    private var averageView:AverageView!
    
    private var topHeight:CGFloat{
        return navigationController!.navigationBar.frame.height + safeAreaEdgeInsets.top
    }
    
    private var cellID:String {
        return "tv_cellid"
    }
    
    private var doDesiease:DODesiease!
    
    override func config() {
        super.config()
        title = "Detection Of Desieases"
        
        tableView.backgroundColor = .clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
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
        tableView.register(DODesieaseTVCell.self, forCellReuseIdentifier: cellID)
        
        averageView = AverageView()
    }
    
    override func insertAndLayoutSubviews() {
        view.addSubview(tableView)
    }
    
    override func fetchData() {
        doDesiease = getDesieaseList()
        averageView.circleProgessView.progressAnimation(duration: 0.2, value: 0.75)
    }
}

extension DetectionOfDesieaseViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doDesiease.desieaseList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DODesieaseTVCell
        cell.data = doDesiease.desieaseList?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return averageView
    }
    
}
