//
//  HomeViewController.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/16/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities

class HomeViewController:MNkViewController,FireAuthAccessible {
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
    
    private var viewWidth:CGFloat {
        return self.view.frame.size.width
    }
    
    private var viewHeight:CGFloat {
        return self.view.frame.size.height
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
        detectionOfDaysButton.activeShadow(using: AppColor.black)
        detectionOfDaysButton.layer.cornerRadius = 4
        detectionOfDaysButton.button.setTitle("Detection Of Days", for: .normal)
        detectionOfDaysButton.button.setTitleColor(AppColor.slateGray, for: .normal)
        detectionOfDaysButton.imageView.image = #imageLiteral(resourceName: "bacteria")
        detectionOfDaysButton.button.addTarget(self, action: #selector(userTappedDOD), for: .touchUpInside)
        
        monthlyDashboardButton = ButtonWithImage()
        monthlyDashboardButton.backgroundColor = AppColor.white
        monthlyDashboardButton.activeShadow(using: AppColor.black)
        monthlyDashboardButton.layer.cornerRadius = 4
        monthlyDashboardButton.button.setTitle("Monthly Spred", for: .normal)
        monthlyDashboardButton.button.setTitleColor(AppColor.slateGray, for: .normal)
        monthlyDashboardButton.imageView.image = #imageLiteral(resourceName: "dashboard")
        monthlyDashboardButton.button.addTarget(self, action: #selector(userTappedMonthlySpred), for: .touchUpInside)
        
        locationButton = ButtonWithImage()
        locationButton.backgroundColor = AppColor.white
        locationButton.activeShadow(using: AppColor.black)
        locationButton.layer.cornerRadius = 4
        locationButton.button.setTitle("Locations", for: .normal)
        locationButton.button.setTitleColor(AppColor.slateGray, for: .normal)
        locationButton.imageView.image = #imageLiteral(resourceName: "pin")
        locationButton.button.addTarget(self, action: #selector(userTappedLocations), for: .touchUpInside)
        
        tempretureButton = ButtonWithImage()
        tempretureButton.backgroundColor = AppColor.white
        tempretureButton.activeShadow(using: AppColor.black)
        tempretureButton.layer.cornerRadius = 4
        tempretureButton.button.setTitle("Temperature", for: .normal)
        tempretureButton.button.setTitleColor(AppColor.slateGray, for: .normal)
        tempretureButton.imageView.image = #imageLiteral(resourceName: "hot")
        tempretureButton.button.addTarget(self, action: #selector(userTappedTempreture), for: .touchUpInside)
        
        aboutButton = ButtonWithImage()
        aboutButton.backgroundColor = AppColor.white
        aboutButton.activeShadow(using: AppColor.black)
        aboutButton.layer.cornerRadius = 4
        aboutButton.button.setTitle("About Us", for: .normal)
        aboutButton.button.setTitleColor(AppColor.slateGray, for: .normal)
        aboutButton.imageView.image = #imageLiteral(resourceName: "about")
        aboutButton.button.addTarget(self, action: #selector(userTappedAboutUs), for: .touchUpInside)
        
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
        accountView.delegate = self
        
        
    }
    
    override func insertAndLayoutSubviews() {
        view.addSubview(scrollView)
        scrollView.contentInsetAdjustmentBehavior = .never
        
        scrollView.activateLayouts(to: view, [.top:0,.leading:0,.traling:0,.bottom:0], true)
        
        scrollView.addSubview(mainSV)
        
        mainSV.activateLayouts(to: scrollView, [.top:30,.leading:10,.traling:-10,.width:viewWidth-10-10])
        
        scrollView.addSubview(accountView)
        
        accountView.activateLayouts(to: scrollView, [.traling:-36,.height:viewWidth*0.4,.width:viewWidth*0.4], true)
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
    
    @objc func userTappedLocations() {
        let locationsVC = LocationsViewController()
        self.navigationController?.pushViewController(locationsVC, animated: true)
    }
    
    @objc func userTappedTempreture() {
        let tempretureVC = TemperatureViewController()
        self.navigationController?.pushViewController(tempretureVC, animated: true)
    }
    
    @objc func userTappedAboutUs() {
        let aboutUsVC = AboutViewController()
        self.navigationController?.pushViewController(aboutUsVC, animated: true)
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
        if accountView.isHidden {
            accountView.isHidden = false
        }else {
            accountView.isHidden = true
        }
    }
}

extension HomeViewController:AccountDelegate {
    func userTappedLogoutButton() {
        accountView.isHidden = true
        do {
            try signOut()
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true, completion: nil)
        }
        catch {
            
        }
    }
}
