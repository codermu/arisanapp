//
//  ShareViewController.swift
//  Arisan
//
//  Created by ibrahim on 11/8/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit
import Social

class ShareViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var shareUrl: UITextField!
    @IBOutlet weak var shareContent: UITextView!
    @IBOutlet weak var shareImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.isNavigationBarHidden = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        // delegate the input
        shareUrl.delegate = self
        shareContent.delegate = self
    }
    
    func shareTapped(){
        // Dismiss the keyboard if it's visible.
        if shareContent.isFirstResponder {
            shareContent.resignFirstResponder()
        }
        
        // Dismiss the keyboard if it's visible.
        if shareUrl.isFirstResponder {
            shareUrl.resignFirstResponder()
        }
        
        
        let actionSheet = UIAlertController(title: "", message: "Share Options", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let contentText  = shareContent.text
        let contentUrl   = shareUrl.text
        let contentImage = shareImage.image
        
        // Configure a new action for sharing the note in Twitter.
        let tweetAction = UIAlertAction(title: "Share on Twitter", style: UIAlertActionStyle.default) { (action) -> Void in
            
            self.shareToTwitter(shareContent: contentText, shareUrl: contentUrl, shareImage: contentImage)
        }
        
        
        // Configure a new action to share on Facebook.
        let facebookPostAction = UIAlertAction(title: "Share on Facebook", style: UIAlertActionStyle.default) { (action) -> Void in
            
            self.shareToFacebook(shareContent: contentText, shareUrl: contentUrl, shareImage: contentImage)
        }
        
        // Configure a new action to share on Facebook.
        let instagramPostAction = UIAlertAction(title: "Share on Instagram", style: UIAlertActionStyle.default) { (action) -> Void in
            let instaMgr = InstagramManager()
            instaMgr.postImageToInstagramWithCaption(imageInstagram: contentImage!, instagramCaption: contentText!, view: self)
        }
        
        // Configure a new action to show the UIActivityViewController
        let moreAction = UIAlertAction(title: "More", style: UIAlertActionStyle.default) { (action) -> Void in
            self.shareMore(shareContent: contentText)
        }
        
        
        let dismissAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.cancel) { (action) -> Void in
            
        }
        
        
        actionSheet.addAction(tweetAction)
        actionSheet.addAction(facebookPostAction)
        actionSheet.addAction(instagramPostAction)
        actionSheet.addAction(moreAction)
        actionSheet.addAction(dismissAction)
        
        present(actionSheet, animated: true, completion: nil)

    }
    
    
    func showAlertMessage(_ message: String!) {
        let alertController = UIAlertController(title: "Social Share", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    
    // MARK: UITextViewDelegate Functions
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    func shareMore(shareContent: String!){
        
        let activityViewController = UIActivityViewController(activityItems: [shareContent], applicationActivities: nil)
        
        activityViewController.excludedActivityTypes = [UIActivityType.mail]
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func shareToTwitter(shareContent: String!,shareUrl : String?, shareImage : UIImage?) {
        
        // Check if sharing to Twitter is possible.
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            // Initialize the default view controller for sharing the post.
            let twitterComposeVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            let shareContentStr = shareContent
            // Set the note text as the default post message.
            if (shareContentStr?.characters.count)! <= 140 {
                twitterComposeVC?.setInitialText("\(shareContentStr)")
            }
            else {
                //let index = advance(self.shareContent.text.startIndex, 140)
                let index = shareContentStr?.index((shareContentStr?.startIndex)!, offsetBy: 140)
                let subText = shareContentStr?.substring(to: index!)
                twitterComposeVC?.setInitialText(subText)
                if shareImage != nil {
                    twitterComposeVC?.add(shareImage)
                }
                if shareUrl != nil {
                    twitterComposeVC?.add(URL(string: shareUrl!))
                }
            }
            
            // Display the compose view controller.
            self.present(twitterComposeVC!, animated: true, completion: nil)
        }
        else {
            self.showAlertMessage("You are not logged in to your Twitter account.")
        }
        
    }
    
    func shareToFacebook(shareContent: String!,shareUrl : String?, shareImage : UIImage?) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
            let facebookComposeVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            facebookComposeVC?.setInitialText(shareContent!)
            
            if shareImage != nil {
                facebookComposeVC?.add(shareImage)
            }
            if shareUrl != nil {
                facebookComposeVC?.add(URL(string: shareUrl!))
            }
            
            self.present(facebookComposeVC!, animated: true, completion: nil)
        }
        else {
            self.showAlertMessage("You are not connected to your Facebook account.")
        }
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
