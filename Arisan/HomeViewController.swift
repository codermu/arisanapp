//
//  HomeViewController.swift
//  Arisan
//
//  Created by ibrahim on 11/3/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let topMenuBar : TopMenuBar = {
        let tmb = TopMenuBar()
        return tmb
    }()
    
    private func setupTopMenuBar(){
        view.addSubview(topMenuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: topMenuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: topMenuBar)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: false)
        setupTopMenuBar()
        
        navigationController?.navigationBar.isTranslucent = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension UIView{
    func addConstraintsWithFormat(format : String, views : UIView...){
        
        var viewsDictionary = [String : UIView]()
        
        for (index,view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
            
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
}
