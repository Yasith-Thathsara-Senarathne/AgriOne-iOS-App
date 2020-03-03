//
//  DODesieaseTVCell.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/24/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities
import LinearProgressBar

class DODesieaseTVCell:MNkTVCell_Parameter<Desiease>{
    private var desieaseIV:UIImageView!
    private var progressBar:LinearProgressBar!
    private var percentageLabel:UILabel!
    private var mainSV:UIStackView!
    
    override func config() {
        backgroundColor = AppColor.white
        activeShadow(using: AppColor.black)
    }
    
    override func createViews() {
        desieaseIV = UIImageView()
        desieaseIV.clipsToBounds = true
        desieaseIV.contentMode = .scaleAspectFill
        
        progressBar = LinearProgressBar()
        progressBar.barPadding = 0
        progressBar.backgroundColor = AppColor.white
        progressBar.trackColor = AppColor.silver
        
        progressBar.barColorForValue = { value in
            switch value {
            case 75..<100:
                return .red
            case 50..<74:
                return .orange
            case 25..<49:
                return .yellow
            default:
                return .green
            }
        }
        
        percentageLabel = UILabel()
        percentageLabel.textColor = AppColor.black
        percentageLabel.textAlignment = .center
        percentageLabel.font = AppFont.font(with: .bold, size: 15)
        
        let stackView = UIStackView.init(arrangedSubviews: [progressBar, percentageLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fillProportionally
        
        mainSV = UIStackView.init(arrangedSubviews: [desieaseIV, stackView])
        mainSV.axis = .horizontal
        mainSV.distribution = .fillEqually
        mainSV.spacing = 10
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(mainSV)
        
        mainSV.activateLayouts(equalConstant: 10, to: self)
        
        progressBar.activateLayouts([.height:30])
        
        desieaseIV.activateLayouts([.height:80])
    }
    
    override func updateUI(with data: Desiease) {
        desieaseIV.image = data.image
        progressBar.progressValue = CGFloat(data.precentage ?? 0)
        percentageLabel.text = (data.precentage?.description ?? "0")+" %"
    }
}
