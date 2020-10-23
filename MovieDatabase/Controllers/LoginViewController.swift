//
//  LoginViewController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 24.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextLabel: UITextField!
    @IBOutlet weak var passwordTextLabel: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        //        loginButton.isUserInteractionEnabled = false
        //        loginButton.layer.opacity = 0.6
        loginButton.layer.cornerRadius = 5
        KeyboardAvoiding.avoidingView = self.loginButton
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with withEvent: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setDelegates() {
        userNameTextLabel.delegate = self
        passwordTextLabel.delegate = self
    }
    
    //MARK: - Authentication Functions
    
    // Create New Tokens.
    func createToken() {
        CreateTokenRequest.init().request(success: { (object) in
            Account.current.token = object
            self.sendToken(token: object.requestToken)
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    // Send Token & Parameters to server side and get Tokens again.
    func sendToken(token: String) {
        LoginRequest.init(userName: "ilkay", password: "htlr1889$" , token: token).request(success: { (object) in
            self.createSessionId(token: object.requestToken)
        }) { (error) in
            
        }
    }
    
    // Create and get SessionID.
    func createSessionId(token: String) {
        CreateSessionRequest.init(token: token).request(success: { (object) in
            Account.current.session = object
            Account.current.login()
            
            self.getUserDetail(sessionId: object.sessionId)
            
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
        
    }
    
    // Get User Detail.
    func getUserDetail(sessionId: String) {
        UserDetailRequest.init(sessionId: sessionId).request(success: { (object) in
            Account.current.user = object
            AppDelegate.shared.setNewMovies()
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    private func enableLoginButton() {
        loginButton.isUserInteractionEnabled = true
        loginButton.layer.opacity = 1.0
    }
    
    private func disableLoginButton() {
        loginButton.isUserInteractionEnabled = false
        loginButton.layer.opacity = 0.6
    }
    
    //    func setButton(){
    //        if userNameTextLabel!.text!.isEmpty || passwordTextLabel!.text!.isEmpty {
    //            loginButton.isEnabled = false
    //            loginButton.layer.opacity = 0.5
    //        }else{
    //            loginButton.isEnabled = true
    //            loginButton.layer.opacity = 1.0
    //        }
    //        loginButton.layer.cornerRadius = 5
    //    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        if let url = URL(string: "https://www.themoviedb.org/account/signup") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        createToken()
        //        if userNameTextLabel!.text!.isEmpty || passwordTextLabel!.text!.isEmpty {
        //            showAlert(titleInput: "Hata", messageInput: "Kullanıcı Adı veya Şifre Alanı Boş Bırakılamaz.")
        //        }else{
        //            createToken()
        //            AppDelegate.shared.setNewMovies()
        //        }
    }
    
    func showAlert(titleInput: String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
}
