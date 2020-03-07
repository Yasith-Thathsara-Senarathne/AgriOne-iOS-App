//
//  AuthLoaderView.swift
//  AgriOne App
//
//  Created by Yasith Thathsara Senarathne on 3/7/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities

class AuthLoaderView:MNkView {
    private var containerView:UIView!
    private var activityIndecator:UIActivityIndicatorView!
    var loadinglabel:UILabel!
    private var stackView:UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func config() {
        isHidden = true
        backgroundColor = AppColor.black.withAlphaComponent(0.45)
    }
    
    var isLoading = false{
        didSet{
            isLoading ? self.start() : self.stop()
        }
    }
    
    override func createViews() {
        containerView = UIView()
        containerView.backgroundColor = AppColor.white
        containerView.layer.cornerRadius = 4
        containerView.layer.borderColor = AppColor.pictonBlue.withAlphaComponent(0.5).cgColor
        containerView.layer.borderWidth = 0.2
        
        activityIndecator = UIActivityIndicatorView()
        activityIndecator.color = AppColor.slateGray
        activityIndecator.hidesWhenStopped = true
        activityIndecator.style = .whiteLarge
        
        loadinglabel = UILabel()
        loadinglabel.text = ""
        loadinglabel.textColor = AppColor.pictonBlue
        loadinglabel.textAlignment = .center
        loadinglabel.numberOfLines = 0
        loadinglabel.font = AppFont.font(with: .medium, size: 12)
        loadinglabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView = UIStackView(arrangedSubviews: [activityIndecator,loadinglabel])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func insertAndLayoutSubviews() {
        containerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
                                     stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0)])
        
        addSubview(containerView)
        
        containerView.activateLayouts(to: self, [.width:120,.height:120])
        
        NSLayoutConstraint.activate([containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
                                     containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)])
    }
    
    
    func start(){
        if isHidden {
            isHidden = false
            activityIndecator.startAnimating()
        }
    }
    
    func stop(){
        if activityIndecator.isAnimating{
            activityIndecator.stopAnimating()
            isHidden = true
        }
        isHidden = true
        return
    }
}
