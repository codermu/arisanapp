//
//  InstagramManager.swift
//  Arisan
//
//  Created by ibrahim on 11/8/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//  Inspired by : http://stackoverflow.com/questions/36406515/post-uiimage-to-instagram-using-swift-similar-to-slcomposeviewcontroller

import UIKit
import Foundation

class InstagramManager: NSObject, UIDocumentInteractionControllerDelegate {
    
    private let kInstagramURL = "instagram://app"
    private let kUTI = "com.instagram.exclusivegram"
    private let kfileNameExtension = "instagram.igo"
    private let kAlertViewTitle = "Error"
    private let kAlertViewMessage = "Please install the Instagram application"
    
    var documentInteractionController = UIDocumentInteractionController()
    
    // singleton manager
    class var sharedManager: InstagramManager {
        struct Singleton {
            static let instance = InstagramManager()
        }
        return Singleton.instance
    }
    
    func postImageToInstagramWithCaption(imageInstagram: UIImage, instagramCaption: String, view: UIViewController) {
        // called to post image with caption to the instagram application
        
        let instagramURL = NSURL(string: kInstagramURL)
        if UIApplication.shared.canOpenURL(instagramURL! as URL) {
            let jpgPath = (NSTemporaryDirectory() as NSString).appendingPathComponent(kfileNameExtension)
            let jpgUrl = URL(fileURLWithPath: jpgPath)
            do{
                try UIImageJPEGRepresentation(imageInstagram, 1.0)!.write(to: jpgUrl, options: Data.WritingOptions.atomic)
            }catch{
                print("operation fail")
            }
                //.writeToFile(jpgPath, atomically: true)
            let rect = CGRect(x: 0, y: 0, width: 612, height: 612)
                //CGRectMake(0,0,612,612)
            let fileURL = NSURL.fileURL(withPath: jpgPath)
            documentInteractionController.url = fileURL
            documentInteractionController.delegate = self
            documentInteractionController.uti = kUTI
            
            // adding caption for the image
            documentInteractionController.annotation = ["InstagramCaption": instagramCaption]
            documentInteractionController.presentOpenInMenu(from: rect, in: view.view, animated: true)
        } else {
            
            // alert displayed when the instagram application is not available in the device
            //UIAlertView(title: kAlertViewTitle, message: kAlertViewMessage, delegate:nil, cancelButtonTitle:"Ok").show()
            
            let alertController = UIAlertController(title: "Social Share", message: kAlertViewMessage, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            view.present(alertController, animated: true, completion: nil)
        }
    }
    
}
