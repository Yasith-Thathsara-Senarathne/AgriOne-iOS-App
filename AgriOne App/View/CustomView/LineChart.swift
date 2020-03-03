//
//  LineChart.swift
//  AgriOne App
//
//  Created by Yasith Thathsara Senarathne on 3/3/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities
import Charts

protocol LineChartDelegate:class {
    func selectedChartValue(with highlight:Highlight)
}

class LineChart:MNkView {
    var lineChartView:LineChartView!
    var lineDataEntry:[ChartDataEntry] = []
    
    var weeklyNames = [String]()
    var weeklyValues = [String]()
    
    var chartDelegate:GetLineChartData! {
        didSet {
            populateData()
            setlineCharts(weeklyNames: weeklyNames, values: weeklyValues)
        }
    }
    
    var delegate:LineChartDelegate?
    
    override func config() {
        backgroundColor = AppColor.white
    }
    
    override func createViews() {
        lineChartView = LineChartView()
        lineChartView.delegate = self
    }
    
    func populateData() {
        self.weeklyNames = chartDelegate.weeklyNames
        self.weeklyValues = chartDelegate.weeklyValues
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(lineChartView)
        
        lineChartView.activateLayouts(to: self, [.top:20,.leading:0,.traling:0,.bottom:-10], true)
        
        lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInSine)
        
    }
    
    private func setlineCharts(weeklyNames:[String], values:[String]) {
        lineChartView.noDataTextColor = AppColor.slateGray
        lineChartView.noDataText = "No Data For The Chart."
        lineChartView.backgroundColor = AppColor.white
        
        for i in 0..<weeklyNames.count {
            let weekName = ChartDataEntry.init(x: Double(i), y: Double(values[i])!)
            lineDataEntry.append(weekName)
        }
        
        let chartDataSet = LineChartDataSet.init(entries: lineDataEntry, label: "Weeks")
        let chartData = LineChartData()
        chartData.addDataSet(chartDataSet)
        chartData.setDrawValues(true)
        chartDataSet.colors = [AppColor.pictonBlue]
        chartDataSet.setCircleColor(AppColor.pictonBlue)
        chartDataSet.circleHoleColor = AppColor.pictonBlue
        chartDataSet.circleRadius = 4.0
        
        let gradientColors = [AppColor.pictonBlue.cgColor,UIColor.clear.cgColor] as CFArray
        let colorLocations:[CGFloat] = [1.0,0.0]
        guard let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations) else { print("Gradient Error")
            return
        }
        
        chartDataSet.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
        chartDataSet.drawFilledEnabled = true
        
        let formatter:LineChartFormatter = LineChartFormatter()
        formatter.setValues(values: weeklyNames)
        let xaxis:XAxis = XAxis()
        xaxis.valueFormatter = formatter
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.xAxis.valueFormatter = xaxis.valueFormatter
        lineChartView.chartDescription?.enabled = false
        lineChartView.legend.enabled = true
        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.drawGridLinesEnabled = false
        lineChartView.leftAxis.drawLabelsEnabled = true
        
        lineChartView.data = chartData
    }
}

extension LineChart:ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print("Clicked",highlight.x)
        delegate?.selectedChartValue(with: highlight)
    }
}
