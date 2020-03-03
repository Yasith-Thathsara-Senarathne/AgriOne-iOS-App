//
//  CircleProgressView.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/24/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities

class CircleProgressView:MNkView{
    var progressLayer:CAShapeLayer!
    var circleLayer:CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createCircularPath()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func config() {
        backgroundColor = .clear
    }
    
    override func createViews() {
        progressLayer = CAShapeLayer()
        progressLayer.strokeColor = AppColor.pinkyRed.cgColor
        
        circleLayer = CAShapeLayer()
        circleLayer.strokeColor = AppColor.riverBed.cgColor
        
    }
    
    func createCircularPath() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 3.0, y: frame.size.height / 3.0), radius: 30, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 9.0
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 9.0
        progressLayer.strokeEnd = 0
        
        layer.addSublayer(circleLayer)
        layer.addSublayer(progressLayer)
    }
    
    func progressAnimation(duration:TimeInterval,value:Float) {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = value
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
