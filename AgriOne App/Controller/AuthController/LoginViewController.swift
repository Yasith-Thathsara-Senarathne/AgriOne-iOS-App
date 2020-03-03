//
//  LoginViewController.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/16/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities

class LoginViewController: MNkViewController {
    private var welcomeLabel:UILabel!
    private var seperateView:UIView!
    private var emailTextField:TextFleidWithSeperator!
    private var passwordTextField:TextFleidWithSeperator!
    private var forgotPasswordLabel:UILabel!
    private var signinButton:UIButton!
    
    private var viewHeight:CGFloat{
        return view.bounds.height
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isToolbarHidden = true
    }
    
    override func config(){
        self.navigationController?.isToolbarHidden = true
        view.backgroundColor = AppColor.white
    }
    
    override func createViews(){
        welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome\nBack."
        welcomeLabel.textAlignment = .left
        welcomeLabel.numberOfLines = 0
        welcomeLabel.textColor = AppColor.black
        welcomeLabel.font = AppFont.font(with: .bold, size: 30)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        seperateView = UIView()
        seperateView.backgroundColor = AppColor.pictonBlue
        seperateView.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField = TextFleidWithSeperator()
        emailTextField.textFeild.placeholder = "Email"
        emailTextField.textFeild.font = .systemFont(ofSize: 13, weight: .medium)
        emailTextField.seperateView.backgroundColor = AppColor.silver
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField = TextFleidWithSeperator()
        passwordTextField.textFeild.placeholder = "Password"
        passwordTextField.textFeild.font = .systemFont(ofSize: 13, weight: .medium)
        passwordTextField.seperateView.backgroundColor = AppColor.silver
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        forgotPasswordLabel = UILabel()
        forgotPasswordLabel.text = "Forgot Password ?"
        forgotPasswordLabel.numberOfLines = 1
        forgotPasswordLabel.textColor = AppColor.slateGray
        forgotPasswordLabel.font = .systemFont(ofSize: 13, weight: .medium)
        forgotPasswordLabel.textAlignment = .right
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        signinButton = UIButton()
        signinButton.setTitle("SIGN IN", for: .normal)
        signinButton.setTitleColor(AppColor.white, for: .normal)
        signinButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        signinButton.layer.cornerRadius = 3
        signinButton.backgroundColor = AppColor.pictonBlue
        signinButton.addTarget(self, action: #selector(userTappedSignIn), for: .touchUpInside)
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override func insertAndLayoutSubviews(){
        let topLabelContainer = UIStackView(arrangedSubviews: [welcomeLabel,seperateView])
        topLabelContainer.axis = .vertical
        topLabelContainer.spacing = 10
        topLabelContainer.alignment = .leading
        topLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        
        seperateView.activateLayouts([.width:40,.height:2])
        
        view.addSubview(topLabelContainer)
        
        topLabelContainer.activateLayouts(to: view, [.top:10,.leading:18,.traling:-18,.height:viewHeight*0.2], true)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,forgotPasswordLabel,signinButton])
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        signinButton.activateLayouts([.height:45])
        
        view.addSubview(stackView)
        
        stackView.activateLayouts(to: view, [.top:viewHeight*0.4,.leading:18,.traling:-18])
        
    }
    
    
    @objc func userTappedSignIn(){
        let homeVC = HomeViewController()
        let navVC = UINavigationController.init(rootViewController: homeVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }

}
