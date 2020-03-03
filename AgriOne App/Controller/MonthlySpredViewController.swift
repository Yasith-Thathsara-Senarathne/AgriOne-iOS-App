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
    
    override func config() {
        title = "Monthly Spred Chart"
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

extension MonthlySpredViewController:LineChartDelegate {
    func selectedChartValue(with highlight: Highlight) {
        if highlight.x <= 4.0 {
            self.navigationController?.pushViewController(WeeklySpredViewController.init(weekNo: Int(highlight.x)), animated: true)
        }
    }
}
