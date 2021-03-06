//
//  FeedTableViewCell.swift
//  iOS-Code-Exercise
//
//  Created by Bhushan Shinde on 30/01/18.
//  Copyright © 2018 Bhushan Shinde. All rights reserved.
//
/**
 FeedTableViewCell is custom class for cell.
 It is used to create required layout and set up constraints programmatically.
 */

import UIKit

class FeedTableViewCell: UITableViewCell {

    var titleLbl = UILabel()
    var descriptionLbl = UILabel()
    var imgView = UIImageView()
    
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier:reuseIdentifier)
        
        self.contentView.addSubview(titleLbl)
        self.contentView.addSubview(descriptionLbl)
        self.contentView.addSubview(imgView)
        //self.backgroundColor = UIColor.red
        
    }
    override func layoutSubviews() {
        //Set Constraints to subviews
        setImageViewConstraints()
        setTitleLabelConstraints()
        setDescriptionLabelConstraints()
        
        setCellFormatting()
        self.contentView.setNeedsLayout()
        self.contentView.layoutIfNeeded()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCellFormatting(){
        // Set formatting to title label
        self.titleLbl.numberOfLines = 0
        self.titleLbl.lineBreakMode = .byWordWrapping
        self.titleLbl.textColor = UIColor.black
        self.titleLbl.textAlignment = .left
        self.titleLbl.font = UIFont.systemFont(ofSize:12)
        
        // Set formatting to description label
        self.descriptionLbl.numberOfLines = 0
        self.descriptionLbl.lineBreakMode = .byWordWrapping
        self.descriptionLbl.textColor = UIColor.black
        self.descriptionLbl.textAlignment = .left
        self.descriptionLbl.font = UIFont.systemFont(ofSize:10)
        
    }
    func setImageViewConstraints(){
       
        self.imgView.translatesAutoresizingMaskIntoConstraints = false
        //self.imgView.backgroundColor = UIColor.red
        let constraintWidth = NSLayoutConstraint(item:self.imgView, attribute:.width, relatedBy:.equal, toItem:nil, attribute:.notAnAttribute, multiplier: 1, constant: 50)
        
        let constraintHeight = NSLayoutConstraint(item:self.imgView, attribute:.height, relatedBy:.equal, toItem:nil, attribute:.notAnAttribute, multiplier:1, constant:50)
        
        let constraintLeading = NSLayoutConstraint(item:self.imgView, attribute:.leading, relatedBy:.equal, toItem:self.imgView.superview, attribute:.leading, multiplier: 1, constant:0)
        
        let constraintTop = NSLayoutConstraint(item:self.imgView, attribute:.top, relatedBy:.equal, toItem:self.imgView.superview, attribute:.top, multiplier:1, constant:0)
        NSLayoutConstraint.activate([constraintWidth,constraintHeight,constraintLeading,constraintTop])
        
    }
    
    func setTitleLabelConstraints(){
        
        self.titleLbl.translatesAutoresizingMaskIntoConstraints = false
        //self.titleLbl.backgroundColor = UIColor.blue
        
        let constraintHeight = NSLayoutConstraint(item:self.titleLbl, attribute:.height, relatedBy:.equal, toItem:nil, attribute:.notAnAttribute, multiplier:1, constant:20)
        
        let constraintLeading = NSLayoutConstraint(item:self.titleLbl, attribute:.leading, relatedBy:.equal, toItem:self.imgView, attribute:.trailing, multiplier: 1, constant:10)
        
        let constraintTrailing = NSLayoutConstraint(item:self.titleLbl, attribute:.trailing, relatedBy:.equal, toItem:self.titleLbl.superview, attribute:.trailing, multiplier:1, constant:10)
        
        let constraintTop = NSLayoutConstraint(item:self.titleLbl, attribute:.top, relatedBy:.equal, toItem:self.titleLbl.superview, attribute:.top, multiplier:1, constant:3)
        NSLayoutConstraint.activate([constraintHeight,constraintLeading,constraintTrailing,constraintTop])
    }
    
    func setDescriptionLabelConstraints(){
        
        self.descriptionLbl.translatesAutoresizingMaskIntoConstraints = false
        //self.descriptionLbl.backgroundColor = UIColor.gray
        
        let constraintLeading = NSLayoutConstraint(item: self.descriptionLbl, attribute: .leading, relatedBy:.equal, toItem:self.imgView, attribute:.trailing, multiplier:1, constant:10)
        
        let constraintTrailing = NSLayoutConstraint(item:self.descriptionLbl, attribute:.trailing, relatedBy:.equal, toItem:self.descriptionLbl.superview, attribute:.trailing, multiplier:1, constant:10)
        
        let constraintTop = NSLayoutConstraint(item:self.descriptionLbl, attribute:.top, relatedBy:.equal, toItem:self.titleLbl, attribute:.bottom, multiplier:1, constant:5)
        
        let constraintBottom = NSLayoutConstraint(item:self.descriptionLbl, attribute:.bottom, relatedBy:.equal, toItem:self.contentView, attribute:.bottom, multiplier:1, constant:5)
        NSLayoutConstraint.activate([constraintLeading,constraintTrailing,constraintTop,constraintBottom])
    }
}
