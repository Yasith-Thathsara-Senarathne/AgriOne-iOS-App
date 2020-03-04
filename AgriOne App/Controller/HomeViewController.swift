//
//  HomeViewController.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/16/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities

class HomeViewController:MNkViewController{
    private var scrollView:UIScrollView!
    private var detectionOfDaysButton:ButtonWithImage!
    private var monthlyDashboardButton:ButtonWithImage!
    private var locationButton:ButtonWithImage!
    private var tempretureButton:ButtonWithImage!
    private var aboutButton:ButtonWithImage!
    private var firstSV:UIStackView!
    private var secoendSV:UIStackView!
    private var thirdSV:UIStackView!
    private var mainSV:UIStackView!
    private var userAccButton:UIButton!
    private var accountView:AccountView!
    
    private var navigationHeight:CGFloat{
        return self.navigationController?.navigationBar.frame.size.height ?? 80
    }
    
    override func config() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = "Dashboard"
        setNavigationBarItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func createViews() {
        scrollView = UIScrollView()
        scrollView.contentMode = .scaleAspectFill
        
        detectionOfDaysButton = ButtonWithImage()
        detectionOfDaysButton.backgroundColor = AppColor.white
        detectionOfDaysButton.activeShadow(using: AppColor.slateGray)
        detectionOfDaysButton.layer.cornerRadius = 4
        detectionOfDaysButton.button.setTitle("Detection Of Days", for: .normal)
        detectionOfDaysButton.button.setTitleColor(AppColor.slateGray, for: .normal)
        detectionOfDaysButton.imageView.image = #imageLiteral(resourceName: "bacteria")
        detectionOfDaysButton.button.addTarget(self, action: #selector(userTappedDOD), for: .touchUpInside)
        
        monthlyDashboardButton = ButtonWithImage()
        monthlyDashboardButton.backgroundColor = AppColor.white
        monthlyDashboardButton.activeShadow(using: AppColor.slateGray)
        monthlyDashboardButton.layer.cornerRadius = 4
        monthlyDashboardButton.button.setTitle("Monthly Spred", for: .normal)
        monthlyDashboardButton.button.setTitleColor(AppColor.slateGray, for: .normal)
        monthlyDashboardButton.imageView.image = #imageLiteral(resourceName: "dashboard")
        monthlyDashboardButton.button.addTarget(self, action: #selector(userTappedMonthlySpred), for: .touchUpInside)
        
        locationButton = ButtonWithImage()
        locationButton.backgroundColor = AppColor.white
        locationButton.activeShadow(using: AppColor.slateGray)
        locationButton.layer.cornerRadius = 4
        locationButton.button.setTitle("Locations", for: .normal)
        locationButton.button.setTitleColor(AppColor.slateGray, for: .normal)
        locationButton.imageView.image = #imageLiteral(resourceName: "pin")
        
        tempretureButton = ButtonWithImage()
        tempretureButton.backgroundColor = AppColor.white
        tempretureButton.activeShadow(using: AppColor.slateGray)
        tempretureButton.layer.cornerRadius = 4
        tempretureButton.button.setTitle("Tempreture", for: .normal)
        tempretureButton.button.setTitleColor(AppColor.slateGray, for: .normal)
        tempretureButton.imageView.image = #imageLiteral(resourceName: "hot")
        
        aboutButton = ButtonWithImage()
        aboutButton.backgroundColor = AppColor.white
        aboutButton.activeShadow(using: AppColor.slateGray)
        aboutButton.layer.cornerRadius = 4
        aboutButton.button.setTitle("About Us", for: .normal)
        aboutButton.button.setTitleColor(AppColor.slateGray, for: .normal)
        aboutButton.imageView.image = #imageLiteral(resourceName: "about")
        
        firstSV = UIStackView.init(arrangedSubviews: [detectionOfDaysButton, monthlyDashboardButton])
        firstSV.axis = .horizontal
        firstSV.spacing = 8
        firstSV.distribution = .fillEqually
        
        secoendSV = UIStackView.init(arrangedSubviews: [locationButton, tempretureButton])
        secoendSV.axis = .horizontal
        secoendSV.spacing = 8
        secoendSV.distribution = .fillEqually
        
        thirdSV = UIStackView.init(arrangedSubviews: [aboutButton])
        thirdSV.axis = .horizontal
        thirdSV.spacing = 8
        thirdSV.distribution = .fillEqually
        
        mainSV = UIStackView.init(arrangedSubviews: [firstSV, secoendSV, thirdSV])
        mainSV.axis = .vertical
        mainSV.spacing = 40
        mainSV.distribution = .fill
        
        userAccButton = UIButton()
        userAccButton.clipsToBounds = true
        userAccButton.setImage(#imageLiteral(resourceName: "user").withRenderingMode(.alwaysTemplate), for: .normal)
        userAccButton.imageView?.tintColor = AppColor.riverBed
        userAccButton.isHidden = true
        userAccButton.addTarget(self, action: #selector(userTappedUserAccountButton), for: .touchUpInside)
        
        accountView = AccountView()
        accountView.isHidden = true
        
        
    }
    
    override func insertAndLayoutSubviews() {
        view.addSubview(scrollView)
        scrollView.contentInsetAdjustmentBehavior = .never
        
        scrollView.activateLayouts(to: view, [.top:70,.leading:0,.traling:0,.bottom:0])
        
        scrollView.addSubview(mainSV)
        
        mainSV.activateLayouts(to: scrollView, [.top:view.safeAreaInsets.top + navigationHeight + 40,.leading:10,.traling:-10,.width:view.bounds.size.width-10-10])
        
        scrollView.addSubview(accountView)
        
        accountView.activateLayouts(to: scrollView, [.top:5,.traling:-5,.height:view.frame.size.height*0.3,.width:view.frame.size.width*0.5], true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        userAccButton.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userAccButton.isHidden = false
    }
    
    @objc func userTappedDOD() {
        let dodVC = DetectionOfDaysViewController()
        self.navigationController?.pushViewController(dodVC, animated: true)
    }
    
    @objc func userTappedMonthlySpred() {
        let monthlySpredVC = MonthlySpredViewController()
        self.navigationController?.pushViewController(monthlySpredVC, animated: true)
    }
}

extension HomeViewController {
    private func setNavigationBarItems(){
        let imageSizeForLargeState:CGFloat = 40
        let imageRightMargin:CGFloat = 16
        let imageBottomMarginForLargeState:CGFloat = 12
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(userAccButton)
        userAccButton.layer.cornerRadius = imageSizeForLargeState / 2
        userAccButton.activateLayouts(to: navigationBar, [.traling:-imageRightMargin,.bottom:-imageBottomMarginForLargeState,.height:imageSizeForLargeState,.width:imageSizeForLargeState])
    }
    
    @objc private func userTappedUserAccountButton() {
        accountView.isHidden = false
    }
}
