//
//  RegisterViewController.swift
//  Arisan
//
//  Created by ibrahim on 11/3/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var userNameInput: TransparentTextField!
    @IBOutlet weak var emailAddressInput: TransparentTextField!
    @IBOutlet weak var passwordInput: TransparentTextField!
    @IBOutlet weak var confirmPasswordInput: TransparentTextField!
    
    
    @IBAction func signUp_tap(_ sender: AnyObject) {
        
        
        
    }
    
    func register(userName:String,emailAddress:String,password:String) {
        
        FIRAuth.auth()?.createUser(withEmail: emailAddress, password: password, completion: {
            users, error in
            
            
            
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
