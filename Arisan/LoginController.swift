//
//  ViewController.swift
//  Arisan
//
//  Created by ibrahim on 11/3/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit
import GoogleSignIn

class LoginController: UIViewController,FBSDKLoginButtonDelegate , GIDSignInUIDelegate {
    
    
    @IBOutlet weak var userNameInput: TransparentTextField!
    @IBOutlet weak var passwordInput: TransparentTextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupFacebookLogin()
        setupGoogleLogin()
    }
    
    fileprivate func setupFacebookLogin(){
        // setup facebook login
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 16, y: view.frame.height - 66, width: view.frame.width - 32, height: 50)
        loginButton.delegate = self
        loginButton.readPermissions = ["email","public_profile"]
    }
    
    fileprivate func setupGoogleLogin() {
        // setup google login
        
        let loginButton = GIDSignInButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 16, y: view.frame.height - 66 - 66, width: view.frame.width - 32, height: 50)
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    @IBAction func login_tap(_ sender: AnyObject) {
        performSegue(withIdentifier: "loggedIn", sender: nil)
        //login(userName: userNameInput.text!, password: passwordInput.text!)
    }
    
    func login(userName:String, password:String){
        FIRAuth.auth()?.signIn(withEmail: userName, password: password, completion: {
            users,error in
            
            if error != nil {
                self.errorMessage.text = error?.localizedDescription
            }else{
                print("logged in")
                self.errorMessage.text = "Logged In"
                self.performSegue(withIdentifier: "loggedIn", sender: nil)
            }
            
        })
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            self.errorMessage.text = error.localizedDescription
            return
        }
        
        let fbAccessToken = FBSDKAccessToken.current()
        
        guard (fbAccessToken?.tokenString) != nil else {
            return
        }
        
        let credential = FIRFacebookAuthProvider.credential(withAccessToken: (fbAccessToken?.tokenString)!)
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                self.errorMessage.text = error?.localizedDescription
            }
            
            print(user)
        })
        
        
        FBSDKGraphRequest.init(graphPath: "/me", parameters: ["fields":"id, name, email"]).start(completionHandler: {
            (connection, result , error) in
            
            if error != nil {
                self.errorMessage.text = error?.localizedDescription
                return
            }
            
            // logged in success
            print(result)
        })
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("user logged out")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

