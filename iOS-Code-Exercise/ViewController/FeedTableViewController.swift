//
//  FeedTableViewController.swift
//  iOS-Code-Exercise
//
//  Created by Bhushan Shinde on 30/01/18.
//  Copyright © 2018 Bhushan Shinde. All rights reserved.
//

import UIKit
let reuseCellIdentifier = "reuseCellIdentifier"
class FeedTableViewController: UITableViewController {
    
    //var feedDataArray : [FeedModel] = Array()
    let viewModelInstance = ViewModel()
    var barTitle : String?
    var activityIndicator : UIActivityIndicatorView!
    var tableRows : [row] = Array()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.setf
        self.tableView.register(FeedTableViewCell.self, forCellReuseIdentifier:reuseCellIdentifier)
        self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        self.tableView.rowHeight = 90;
        
        requestData()
    }
    
    func requestData(){
        displayBusyIndicator()
        viewModelInstance.requestDataFromNetworkManager { (rows,title) in
            if (rows.isEmpty){
                print("No Data found!")
            }else{
              self.tableRows = rows
                DispatchQueue.main.async {
                   self.hideBusyIndicator()
                    self.navigationItem.title = title
                   self.tableView.reloadData()
                }
            }
        }
    }
    
    func displayBusyIndicator(){
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle:.gray)
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = self.tableView.center
        self.tableView.addSubview(activityIndicator)
    }
    func hideBusyIndicator(){
       activityIndicator.stopAnimating()
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableRows.count > 0 ? tableRows.count : 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : FeedTableViewCell =  tableView.dequeueReusableCell(withIdentifier:reuseCellIdentifier, for: indexPath) as! FeedTableViewCell
        cell.selectionStyle = .none
        let tableRow = tableRows[indexPath.row]
        cell.titleLbl.text = tableRow.title!
        cell.descriptionLbl.text = tableRow.description!
        cell.imgView.image = UIImage(named:"Placeholder")
        viewModelInstance.getImageForCell(url:tableRow.imageHref!) { (cellImage) in
            DispatchQueue.main.async {
                cell.imgView.image = cellImage
            }
        }
        return cell
    }
    // MARK: - Table view Delegates
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
}
