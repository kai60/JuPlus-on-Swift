//
//  FurnitureController.swift
//  JuPlus
//
//  Created by 祝发冬 on 15/12/18.
//  Copyright © 2015年 祝发冬. All rights reserved.
//

import Foundation
import UIKit


class FurnitureController:RootViewController,UITableViewDelegate,UITableViewDataSource
{
    
    var tableView:UITableView!
    var dataArray:NSMutableArray!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        self.title="居+"
        self.UIConfig()
        
    }
    
    func prepareData()
    {
        dataArray=NSMutableArray()
    }
    func UIConfig ()
    {
        tableView=UITableView (frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height), style: UITableViewStyle.Plain)
        self.view .addSubview(tableView)
    }
    
   // MARK:tableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return dataArray.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let identifier="cell"
        var cell:UITableViewCell?=tableView.dequeueReusableCellWithIdentifier(identifier)
        if(cell==nil)
        {
            cell=UITableViewCell (style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
        }
        return cell!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        print("disdselcted")
        
    }
    
    
    
}