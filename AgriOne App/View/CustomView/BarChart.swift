//
//  BarChart.swift
//  AgriOne App
//
//  Created by Yasith Thathsara Senarathne on 3/3/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities
import Charts

class BarChart:MNkView {
    var barChartView:BarChartView!
    var barDataEntry:[BarChartDataEntry] = []
    
    var dayNames = [String]()
    var dayValues = [String]()
    
    var chartDelegate:GetBarChartData! {
        didSet {
            populateData()
            setBarCharts(dayNames: dayNames, values: dayValues)
        }
    }
    
    override func config() {
        backgroundColor = AppColor.white
    }
    
    override func createViews() {
        barChartView = BarChartView()
    }
    
    func populateData() {
        self.dayNames = chartDelegate.dayNames
        self.dayValues = chartDelegate.dayValues
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(barChartView)
        
        barChartView.activateLayouts(to: self, [.top:20,.leading:0,.traling:0,.bottom:-10], true)
        
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInSine)
        
    }
    
    private func setBarCharts(dayNames:[String], values:[String]) {
        barChartView.noDataTextColor = AppColor.slateGray
        barChartView.noDataText = "No Data For The Chart."
        barChartView.backgroundColor = AppColor.white
        
        for i in 0..<dayNames.count {
            let dayName = BarChartDataEntry.init(x: Double(i), y: Double(values[i])!)
            barDataEntry.append(dayName)
        }
        
        let chartDataSet = BarChartDataSet.init(entries: barDataEntry, label: "Days")
        let chartData = BarChartData()
        chartData.addDataSet(chartDataSet)
        chartData.setDrawValues(false)
        chartDataSet.colors = [AppColor.pictonBlue,AppColor.pinkyRed]
        
        let formatter:BarChartFormatter = BarChartFormatter()
        formatter.setValues(values: dayNames)
        let xaxis:XAxis = XAxis()
        xaxis.valueFormatter = formatter
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.xAxis.valueFormatter = xaxis.valueFormatter
        barChartView.chartDescription?.enabled = false
        barChartView.legend.enabled = true
        barChartView.rightAxis.enabled = false
        barChartView.leftAxis.drawGridLinesEnabled = false
        barChartView.leftAxis.drawLabelsEnabled = true
        
        barChartView.data = chartData
    }
}
