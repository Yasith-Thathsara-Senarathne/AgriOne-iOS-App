//
//  LoginViewController.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/16/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities
import Firebase
import FirebaseAuth

class LoginViewController: MNkViewController {
    private var welcomeLabel:UILabel!
    private var seperateView:UIView!
    private var emailTextField:TextFleidWithSeperator!
    private var passwordTextField:TextFleidWithSeperator!
    private var errorLabel:UILabel!
    private var forgotPasswordLabel:UILabel!
    private var signinButton:UIButton!
    private var authLoaderView:AuthLoaderView!
    
    private var viewHeight:CGFloat {
        return view.bounds.height
    }
    
    private var emptySigninDefaultError:String {
        return "Email or password cannot be empty."
    }
    
    private var signinDefaultError:String {
        return "Oops! Some error has occured while sign in. Try again in later."
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
        
        seperateView = UIView()
        seperateView.backgroundColor = AppColor.pictonBlue
        
        emailTextField = TextFleidWithSeperator()
        emailTextField.textFeild.placeholder = "Email"
        emailTextField.textFeild.font = .systemFont(ofSize: 13, weight: .medium)
        emailTextField.seperateView.backgroundColor = AppColor.silver
        
        passwordTextField = TextFleidWithSeperator()
        passwordTextField.textFeild.placeholder = "Password"
        passwordTextField.textFeild.font = .systemFont(ofSize: 13, weight: .medium)
        passwordTextField.seperateView.backgroundColor = AppColor.silver
        passwordTextField.textFeild.isSecureTextEntry = true
        
        errorLabel = UILabel()
        errorLabel.text = emptySigninDefaultError
        errorLabel.numberOfLines = 0
        errorLabel.textColor = AppColor.pinkyRed
        errorLabel.font = .systemFont(ofSize: 13, weight: .medium)
        errorLabel.textAlignment = .center
        errorLabel.isHidden = true
        
        forgotPasswordLabel = UILabel()
        forgotPasswordLabel.text = "Forgot Password ?"
        forgotPasswordLabel.numberOfLines = 1
        forgotPasswordLabel.textColor = AppColor.slateGray
        forgotPasswordLabel.font = .systemFont(ofSize: 13, weight: .medium)
        forgotPasswordLabel.textAlignment = .right
        
        signinButton = UIButton()
        signinButton.setTitle("SIGN IN", for: .normal)
        signinButton.setTitleColor(AppColor.white, for: .normal)
        signinButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        signinButton.layer.cornerRadius = 3
        signinButton.backgroundColor = AppColor.pictonBlue
        signinButton.addTarget(self, action: #selector(userTappedSignIn), for: .touchUpInside)
        
        authLoaderView = AuthLoaderView.init(frame: view.frame)
        authLoaderView.loadinglabel.text = "Please Wait"
        
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
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,errorLabel,forgotPasswordLabel,signinButton])
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        signinButton.activateLayouts([.height:45])
        
        view.addSubview(stackView)
        
        stackView.activateLayouts(to: view, [.top:viewHeight*0.4,.leading:18,.traling:-18])
        
        view.addSubview(authLoaderView)
        
        authLoaderView.activateLayouts(to: self.view)
        
    }
    
    
    @objc func userTappedSignIn(){
        self.errorLabel.text = emptySigninDefaultError
        self.errorLabel.isHidden = true
        
        guard let email = emailTextField.textFeild.text,
            !email.isEmpty,
            let password = passwordTextField.textFeild.text,
            !password.isEmpty else {
                self.errorLabel.isHidden = false
                return
        }
        validateSignInValues(with: emailTextField.textFeild.text ?? "", password: passwordTextField.textFeild.text ?? "")
    }
    
    private func validateSignInValues(with email:String, password:String) {
        self.authLoaderView.start()
        signInToFirebaseWithEmailPassword(with: email, password: password) { [weak self] (user, error) in
            self?.authLoaderView.stop()
            guard let user = user,
                error == nil else {
                    self?.errorLabel.text = self?.signinDefaultError
                    self?.errorLabel.isHidden = false
                    return
            }
            
            let homeVC = HomeViewController()
            let navVC = UINavigationController.init(rootViewController: homeVC)
            navVC.modalPresentationStyle = .fullScreen
            self?.present(navVC, animated: true, completion: nil)
        }
    }
}

extension LoginViewController:FireAuthAccessible {
    private func signInToFirebaseWithEmailPassword(with email:String, password:String,_ completed:@escaping (_ user:User?, _ error:String?)->()) {
        Auth.auth().signIn(withEmail: email, password: password) { userResult, error in
            completed(userResult?.user,error?.localizedDescription)
        }
    }
}
