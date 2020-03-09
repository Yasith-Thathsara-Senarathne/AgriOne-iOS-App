//
//  WeeklySpredViewController.swift
//  AgriOne App
//
//  Created by Yasith Thathsara Senarathne on 3/3/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities
import  Charts

protocol GetBarChartData {
    func getChartData(with dataPoints:[String], values:[String])
    var dayNames:[String] {get set}
    var dayValues:[String] {get set}
}

class WeeklySpredViewController:MNkViewController,GetBarChartData {
    var dayValues = [String]()
    var dayNames = [String]()
    
    var weekNo:Int!
    
    init(weekNo:Int) {
        super.init(nibName: nil, bundle: nil)
        self.weekNo = weekNo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func config() {
        title = "Week \(weekNo+1) Spred Chart"
        setNavigationBarItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func populateChartData() {
        dayNames = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
        dayValues = ["32","45","12","78","54","40","5"]
    }
    
    func getChartData(with dataPoints: [String], values: [String]) {
        self.dayNames = dataPoints
        self.dayValues = values
    }
    
    func barChart() {
        let barChart = BarChart.init(frame: CGRect.init(x: 0.0, y: 0.0, width: self.view.frame.width-5, height: self.view.frame.height-5))
        barChart.chartDelegate = self
        self.view.addSubview(barChart)
    }
    
    override func fetchData() {
        populateChartData()
        barChart()
    }
}

public class BarChartFormatter:NSObject,IAxisValueFormatter {
    var dayNames = [String]()
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return dayNames[Int(value)]
    }
    
    public func setValues(values:[String]) {
        self.dayNames = values
    }
}

extension WeeklySpredViewController {
    private func setNavigationBarItems(){
        let addButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "report"), style: .plain, target: self, action: #selector(userTappedGenerateReportButton))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc private func userTappedGenerateReportButton() {
        self.view.toImage { (image) in
            guard let image = image else { return }
            
            let pdfPreviewVC = PDFPreviewVewController()
            
            let pdfCreator = PDFCreator(title: "Week \(self.weekNo+1) Spred Report", image: image)
            pdfPreviewVC.documentData = pdfCreator.createFlyer()
            
            self.navigationController?.pushViewController(pdfPreviewVC, animated: true)
        }
    }
}
