//
//  Auth.swift
//  Arisan
//
//  Created by ibrahim on 11/7/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import Foundation
import FirebaseAuth

struct apiRes {
    let message : String
    let status  : Bool
    
    init(message:String,status : Bool) {
        self.message = message
        self.status = status
    }
}

class Auth{
    
//    class func login(userName:String, password:String) -> apiRes? {
//        
//        var res : apiRes? = nil
//        
//        FIRAuth.auth()?.signIn(withEmail: userName, password: password, completion: {
//            users,error in
//            
//            if error != nil {
//                //self.errorMessage.text = error?.localizedDescription
//                print(error?.localizedDescription)
//                res = apiRes(message: (error?.localizedDescription)!, status: false)
//            }else{
//                res = apiRes(message: "Logged In", status: true)
//            }
//            
//        })
//        
//        return res
//        
//    }
    
}
