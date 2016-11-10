//
//  InvitationCell.swift
//  Arisan
//
//  Created by ibrahim on 11/9/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit

class InvitationCell: BaseCell,UITableViewDataSource,UITableViewDelegate {
    
    lazy var invitationView : InvitationTableView = {
        let iv = InvitationTableView()
        iv.tableView.dataSource = self
        iv.tableView.delegate = self
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        invitationView.emptyView.isHidden = true
        invitationView.loading.hidesWhenStopped = true
        
        addSubview(invitationView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: invitationView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: invitationView)
        
        invitationView.tableView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row % 2 == 0 {
            
            let nibName = UINib(nibName: "InvitationTableViewCell", bundle: nil)
            tableView.register(nibName, forCellReuseIdentifier: invitationView.cellIdentifier)
            
            let cell = tableView.dequeueReusableCell(withIdentifier: invitationView.cellIdentifier, for: indexPath) as! InvitationTableViewCell
    
            return cell
        
        }else{
            
            let cell = UITableViewCell()
            
            cell.textLabel!.text = nil
            cell.imageView?.image = nil
            
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row % 2 == 0 {
            return 80
        }else{
            return 20
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 * 2
    }
    
}
