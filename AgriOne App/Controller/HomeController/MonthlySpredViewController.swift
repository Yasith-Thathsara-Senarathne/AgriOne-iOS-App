//
//  MonthlySpredViewController.swift
//  AgriOne App
//
//  Created by Yasith Thathsara Senarathne on 3/3/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities
import Charts

protocol GetLineChartData {
    func getChartData(with dataPoints:[String], values:[String])
    var weeklyNames:[String] {get set}
    var weeklyValues:[String] {get set}
}

class MonthlySpredViewController:MNkViewController,GetLineChartData {
    var weeklyValues = [String]()
    var weeklyNames = [String]()
    private var loaderView:AuthLoaderView!
    
    override func config() {
        title = "Monthly Spred Chart"
        setNavigationBarItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func populateChartData() {
        weeklyNames = ["W 1","W 2","W 3","W 4"]
        weeklyValues = ["32","45","12","78"]
    }
    
    func getChartData(with dataPoints: [String], values: [String]) {
        self.weeklyNames = dataPoints
        self.weeklyValues = values
    }
    
    func lineChart() {
        let lineChart = LineChart.init(frame: CGRect.init(x: 0.0, y: 0.0, width: self.view.frame.width-5, height: self.view.frame.height-5))
        lineChart.chartDelegate = self
        lineChart.delegate = self
        self.view.addSubview(lineChart)
    }
    
    override func createViews() {
        loaderView = AuthLoaderView.init(frame: view.frame)
        loaderView.loadinglabel.text = "Exporting PDF"
    }
    
    override func insertAndLayoutSubviews() {
        view.addSubview(loaderView)
        
        loaderView.activateLayouts(to: self.view)
    }
    
    override func fetchData() {
        populateChartData()
        lineChart()
    }
}

public class LineChartFormatter:NSObject,IAxisValueFormatter {
    var weeklyNames = [String]()
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return weeklyNames[Int(value)]
    }
    
    public func setValues(values:[String]) {
        self.weeklyNames = values
    }
}

extension MonthlySpredViewController {
    private func setNavigationBarItems(){
        let addButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "report"), style: .plain, target: self, action: #selector(userTappedGenerateReportButton))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc private func userTappedGenerateReportButton() {
        self.loaderView.start()
        self.view.toImage { (image) in
            self.loaderView.stop()
            guard let image = image else { return }
            
            let pdfPreviewVC = PDFPreviewVewController()
            
            let pdfCreator = PDFCreator(title: "Monthly Spred Report", image: image)
            pdfPreviewVC.documentData = pdfCreator.createFlyer()
            
            self.navigationController?.pushViewController(pdfPreviewVC, animated: true)
        }
    }
}

extension MonthlySpredViewController:LineChartDelegate {
    func selectedChartValue(with highlight: Highlight) {
        if highlight.x <= 4.0 {
            self.navigationController?.pushViewController(WeeklySpredViewController.init(weekNo: Int(highlight.x)), animated: true)
        }
    }
}
